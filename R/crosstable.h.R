
# This file is automatically generated, you probably don't want to edit this

crosstableOptions <- if (requireNamespace('jmvcore')) R6::R6Class(
    "crosstableOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            vars = NULL,
            group = NULL,
            sty = "nejm", ...) {

            super$initialize(
                package='ClinicoPath',
                name='crosstable',
                requiresData=TRUE,
                ...)

            private$..vars <- jmvcore::OptionVariables$new(
                "vars",
                vars)
            private$..group <- jmvcore::OptionVariable$new(
                "group",
                group,
                suggested=list(
                    "ordinal",
                    "nominal"),
                permitted=list(
                    "factor"))
            private$..sty <- jmvcore::OptionList$new(
                "sty",
                sty,
                options=list(
                    "nejm",
                    "lancet",
                    "hmisc"),
                default="nejm")

            self$.addOption(private$..vars)
            self$.addOption(private$..group)
            self$.addOption(private$..sty)
        }),
    active = list(
        vars = function() private$..vars$value,
        group = function() private$..group$value,
        sty = function() private$..sty$value),
    private = list(
        ..vars = NA,
        ..group = NA,
        ..sty = NA)
)

crosstableResults <- if (requireNamespace('jmvcore')) R6::R6Class(
    inherit = jmvcore::Group,
    active = list(
        text3 = function() private$.items[["text3"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Cross Tables",
                refs=list(
                    "tangram"))
            self$add(jmvcore::Html$new(
                options=options,
                name="text3",
                title="CrossTable Tangram NEJM"))}))

crosstableBase <- if (requireNamespace('jmvcore')) R6::R6Class(
    "crosstableBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = 'ClinicoPath',
                name = 'crosstable',
                version = c(1,0,0),
                options = options,
                results = crosstableResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' Cross Tables
#'
#' Function for making Cross Tables.
#'
#' @examples
#' \dontrun{
#' # example will be added
#'}
#' @param data The data as a data frame.
#' @param vars .
#' @param group variable in the column
#' @param sty .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$text3} \tab \tab \tab \tab \tab a html \cr
#' }
#'
#' @export
crosstable <- function(
    data,
    vars,
    group,
    sty = "nejm") {

    if ( ! requireNamespace('jmvcore'))
        stop('crosstable requires jmvcore to be installed (restart may be required)')

    if ( ! missing(vars)) vars <- jmvcore::resolveQuo(jmvcore::enquo(vars))
    if ( ! missing(group)) group <- jmvcore::resolveQuo(jmvcore::enquo(group))
    if (missing(data))
        data <- jmvcore::marshalData(
            parent.frame(),
            `if`( ! missing(vars), vars, NULL),
            `if`( ! missing(group), group, NULL))

    for (v in group) if (v %in% names(data)) data[[v]] <- as.factor(data[[v]])

    options <- crosstableOptions$new(
        vars = vars,
        group = group,
        sty = sty)

    analysis <- crosstableClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}
