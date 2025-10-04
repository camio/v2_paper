#import "wg21.typ" as wg21

#show: wg21.template.with(
  paper_number: "D????R0",
  audience: "LEWG",
  title: [V2: An Evolution Path for the Standard Library [DRAFT]],
  authors: (
    (
      name: "David Sankel",
      institution: "Adobe",
      mail: "dsankel@adobe.com",
    ),
  ),
  date: (
    year: 2025,
    month: "October",
    day: 4,
  ),
  abstract: [
    The C++ standard library's commitment to strong backward compatibility is a
    core strength, providing users with low-cost upgrades. However, this
    guarantee complicates library evolution. When existing types or functions
    require revision, compatibility constraints often result in awkward
    compromises, such as placing superior replacements in different namespaces
    or assigning them less intuitive names. This naming challenge, in turn,
    often discourages the introduction of otherwise beneficial enhancements. The
    resulting haphazard approach confuses developers about best practices and
    unnecessarily increases the library's perceived complexity. We propose a
    structured methodology for evolving the standard library that accommodates
    interface-breaking changes while preserving backward compatibility, thereby
    eliminating the need for inconsistent naming and namespacing conventions.

    #v(12pt)

    #table(
      columns: (auto,auto,auto,auto),
      stroke: 1pt,
      table.header(table.cell(colspan:2, align:center, [*Historical evolutions*]), table.cell(colspan:2, align:center, [*If V2 were adopted*])),
      [*Old*], [*New*], [*Old*], [*New*],
      table.hline(),
      [
      ```Cpp
      std::lock_guard l(m);
      ```
      ],
      [
      ```Cpp
      std::scoped_lock l(m);
      ```
      ],
      [
      ```Cpp
      std::lock_guard l(m);
      std::cpp11::lock_guard l(m);
      ```
      ],
      [
      ```Cpp
      std::lock_guard2 l(m);
      std::cpp17::lock_guard l(m);
      ```
      ],
      [
      ```Cpp
      std::sort(
        v.begin(),
        v.end());
      ```
      ],
      [
      ```Cpp
      std::ranges::sort(
        v.begin(),
        v.end());
      ```
      ],
      [
      ```Cpp
      std::sort(
        v.begin(),
        v.end());
      std::cpp98::sort(
        v.begin(),
        v.end());
      std::cpp17::sort(
        v.begin(),
        v.end());
      ```
      ],
      [
      ```Cpp
      std::sort2(
        v.begin(),
        v.end());
      std::cpp20::sort(
        v.begin(),
        v.end());
      ```
      ],
      [
      ```Cpp
      std::function f =
        /*...*/;
      ```
      ],
      [
      ```Cpp
      std::copyable_funciton f =
        /*...*/;
      ```
      ],
      [
      ```Cpp
      std::function f =
        /*...*/;
      std::cpp11::function f =
        /*...*/;
      ```
      ],
      [
      ```Cpp
      std::function2 f =
        /*...*/;
      std::cpp26::function f =
        /*...*/;
      ```
      ],
    )
  ],
)

// TODO: Consider adding std::thread to std::jthread

// TODO: Incorporate stuff from previous incantation
// * Abstract
//   Functionality in the C++ standard library, like most other libraries,
//   changes over time to account for new language features and address defects.
//   When changes result in backwards-incompatible API changes or ABI breakage,
//   standard library authors are forced to introduce a new name for the
//   component. Unfortunately, the resulting name mishmash has resulted in a
//   seriously incoherent and confusing offering, especially for new users. This
//   proposal suggests V2: a simple, granular, convention for component upgrades.
// 
//   | Original          | Incoherent               | As-if V2 were used |
//   |-------------------+--------------------------+--------------------|
//   | ~std::function~   | ~std::copyable_function~ | ~std::function2~   |
//   | ~std::thread~     | ~std::jthread~           | ~std::thread2~     |
//   | ~std::lock_guard~ | ~std::scoped_lock~       | ~std::lock_guard2~ |
//   | ~std::sort~       | ~std::ranges::sort~      | ~std::sort2~       |
// 
// * History
//   - Problem came up with std::ranges discussion
//   - std2 was proposed as a solution
//     - Too cumbersome to use (different prefix)
//     - Implies a new version of the whole library, which isn't granular enough
// 
// * Proposal
//   - Adopt usage of a suffix 2,3,...,n
//   - Benefits of this convention
//     - Individual components evolve independently
//     - Low syntactic overhead
//     - User experience is improved. The "better" name is always available.
//     - Facilitates movement to new APIs for users
//   - Will see direct use in hash maps and hash set improvements
// 
// * Tradeoffs
//   - atan2
//   - Opens the door for updates, but we must be conservative when introducing
//     new versions. Users can only take so much instability.
//   - Makes possible to change APIs drastically, but we must consider adoption costs
// 
// * Conclusion
// 
// * TODO
//   - Figure out how to improve the preamble by making it into a function so it
//     can get, e.g., a paper number and audience so I don't need to hardcode them
//     in .dir-locals.el.

= Introduction


= Key `std::trivially_relocate` limitations <sec-usecases>


= `restart_lifetime`


= Implementation


= Other considerations

= Alternatives considered

== Anonymous namespaces

= Wording

= Conclusion

= Acknowledgments

We would like to thank ...

#bibliography("references.yml", style: "ieee")
