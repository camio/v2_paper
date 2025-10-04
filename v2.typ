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
