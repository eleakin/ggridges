#' Scales for point aesthetics
#'
#' These are various scales that can be applied to point aesthetics, such as
#' `point_color`, `point_fill`, `point_size`. The individual scales all have the
#' same usage as existing standard ggplot2 scales, only the name differs.
#'
#' @name scale_point
#' @aliases NULL
NULL

#' `scale_point_shape`: Equivalent to [`scale_shape`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_shape <- function(..., solid = TRUE)
{
  discrete_scale("point_shape", "shape_d", scales::shape_pal(solid), ...)
}

#' `scale_point_size_continuous`: Equivalent to [`scale_size_continuous`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_size_continuous <- function(name = ggplot2::waiver(), breaks = ggplot2::waiver(), labels = ggplot2::waiver(),
                                  limits = NULL, range = c(1, 6),
                                  trans = "identity", guide = "legend", aesthetics = "point_size") {
  ggplot2::continuous_scale(aesthetics, "area", scales::area_pal(range), name = name,
                   breaks = breaks, labels = labels, limits = limits, trans = trans,
                   guide = guide)
}

#' `scale_point_color_hue`: Equivalent to [`scale_colour_hue`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_color_hue <- function(..., h = c(0, 360) + 15, c = 100, l = 65, h.start = 0,
                                  direction = 1, na.value = "grey50", aesthetics = "point_color")
{
  ggplot2::discrete_scale(aesthetics, "hue",
                          scales::hue_pal(h, c, l, h.start, direction), na.value = na.value, ...)
}

#' `scale_point_fill_hue`: Equivalent to [`scale_fill_hue`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_fill_hue <- function(...) scale_point_color_hue(..., aesthetics = "point_fill")

#' `scale_point_color_gradient`: Equivalent to [`scale_colour_gradient`]. Note that this scale cannot
#'   draw a legend, however, because of limitations in [`guide_colorbar`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_color_gradient <- function(..., low = "#132B43", high = "#56B1F7", space = "Lab",
                                        na.value = "grey50", guide = "none", aesthetics = "point_color")
{
  ggplot2::continuous_scale(aesthetics, "gradient", scales::seq_gradient_pal(low, high, space),
                            na.value = na.value, guide = guide, ...)
}

#' `scale_point_fill_gradient`: Equivalent to [`scale_fill_gradient`]. Note that this scale cannot
#'   draw a legend, however, because of limitations in [`guide_colorbar`].
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_fill_gradient <- function(...) scale_point_color_gradient(..., aesthetics = "point_fill")

#' Generic discrete manual scale
#'
#' Generic discrete manual scale.
#'
#' @param aesthetics The aesthetics for which this scale should be used
#' @param values List of values to be used as palette
#' @param ... Other parameters handed off to [discrete_scale]
#' @export
scale_discrete_manual <- function(aesthetics, values, ...)
{
  pal <- function(n) {
    if (n > length(values)) {
      stop("Insufficient values in manual scale. ", n,
           " needed but only ", length(values), " provided.",
           call. = FALSE)
    }
    values
  }
  discrete_scale(aesthetics, "manual", pal, ...)
}


# default scales
#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_shape_discrete <- scale_point_shape

#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_color_discrete <- scale_point_color_hue

#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_fill_discrete <- scale_point_fill_hue

#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_color_continuous <- scale_point_color_gradient

#' @rdname scale_point
#' @usage NULL
#' @export
scale_point_fill_continuous <- scale_point_fill_gradient
