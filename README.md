# gsoc_animint

A summary of the work done on the [**Animint**](https://github.com/tdhock/animint) project under the R Project for Statistical Computing for Google Summer of Code 2016

##### Student Name: [Faizan Uddin Fahad Khan](https://github.com/faizan-khan-iit)

##### Mentors: [Toby Dylan Hocking](https://github.com/tdhock), [Carson Sievert](https://github.com/cpsievert)

##### Other Collaborators: [Kevin Ferris](https://github.com/kferris10), [Tony Tsai](https://github.com/caijun)


#### Acknowlegment:

A great thanks to both of my mentors Toby and Carson, who made my work on this project enjoyable and kept me motivated throughout the project. And special thanks to both Kevin and Tony who provided valuable feedback during the project.

___

### The Project:

#### Application Period:

During this period, I completed the tests and [submitted a PR](https://github.com/tdhock/animint/pull/141) to the Animint repository adding a test to the testing framework. All the code written for the tests may be seen [here](https://github.com/faizan-khan-iit/gsoc_animint/commits/master).

#### Community Bonding Period:

This period was mainly interactive as I exchanged mails with my mentors and set up my working environment. It was also decided that the project would start with supporting the newer version of the [`ggplot2` package](https://github.com/hadley/ggplot2). Toby, Carson and Kevin were a great help during this time while I was getting familiar with the code and the workflow of the package.

#### Coding Period - I:

As decided, during the first coding period the aim was to get [Animint to work with `ggplot2` v2.0+](https://github.com/tdhock/animint/pull/135). Thanks to the initial efforts by Kevin, it was much easier for me to narrow down the code that needed the most attention. Over the period of one month, I worked on getting all the existing tests to pass and was able to complete the task in time for the midterm evaluations. During this time, to support the `chunk_vars` option exclusive to Animint, I submitted a [PR to the `ggplot2` package](https://github.com/hadley/ggplot2/pull/1649). After some discussion, it was decided that the PR would not be merged, so we started using [my `ggplot2` fork](https://github.com/faizan-khan-iit/ggplot2/tree/validate-params).

#### Coding Period - II:

After completing the midterm evaluations, I worked to fix some issues in the package ([#100](https://github.com/tdhock/animint/issues/100) and [#155](https://github.com/tdhock/animint/issues/155)). The fix itself was simple, but getting the testing framework to work was a bit tough and took some time. [This PR](https://github.com/tdhock/animint/pull/156) took priority because another GSoC student [Akash](https://github.com/analyticalmonk) who was using Animint for his project, ran into the issue with tooltips.

After that I did work to add a new feature, [`stroke` aesthetic for `geom_point`](https://github.com/tdhock/animint/issues/127). This feature was easy to implement and was closed by [this PR](https://github.com/tdhock/animint/pull/157).

The next feature that I started to work on was the [axis updates feature](https://github.com/tdhock/animint/pull/158). Both the Animint compiler and renderer needed major additions for this to work. Support for axis updates was added for most of the `geoms` in Animint. Currently the axis updates work for most cases of single selection variables.

___

### Links to changes during the project:

1. Tests during application phase: https://github.com/faizan-khan-iit/gsoc_animint/commits/master

2. Commits to Animint code: https://github.com/tdhock/animint/commits?author=faizan-khan-iit

3. `ggplot2` PR: https://github.com/hadley/ggplot2/pull/1649/commits 

___

### Further Work:

I intend to continue working with the package. Some features including axis updates for multiple selection variables, support for `HTMLWidgets` and multiple `clickSelects` are still to be implemented. I will be working on these in the coming days. More information about these may be found below. Anyone willing to contribute to the package is welcome!

1. `HTMLWidgets` integration: https://github.com/tdhock/animint/issues/50

2. Multiple `clickSelects`: https://github.com/tdhock/animint/pull/31 


