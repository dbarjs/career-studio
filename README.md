# Career Studio

It's a platform for you know yourself better and build your career with confidence.

- Who I was
- Who I am
- Who I will be (or want to be)

## Entities

### User

### Career

### Career Elements

Like experiences and goals, elements are the building blocks of a career. They are the smallest unit of a career. They are the things that make up a career.

#### Element Types

- Skills
- Positions
- Projects
- Education
- Certifications
- Milestones
- Accomplishments
- Awards
- Publications
- Languages
- Interests
- References
- Testimonials
- Memberships
- Patents
- Profiles

#### Element Links

Links are the way to connect elements. They are the way to connect elements to each other. For instance, a skill can be linked to a position or a project, in way

### Career Views

Views are the way to see a career. They are the way to present a career to others.

View types:

- Resume
- Portfolio
- Profile

## References

- [i18n-iso-countries](https://www.npmjs.com/package/i18n-iso-countries)

# Example

users:

- $dbarjs

* careers:

  - $dbarjs-pro-career:
    owner: $dbarjs

    - links:

      - $tfy-senior-software-engineer-js-skill
        type: develops
        period:
        from: 0
        to: 50

    - elements:

      - $js-skill:
        type: skill
        title: JavaScript
        level: 5
        years: 10
        description: I love JavaScript
        tags: [js, javascript, nodejs, node, react]

        - variants:
          - $js-skill-variant-1
            type: variant
            level: 5
            years: 10
            description: I love JavaScript
            tags: [js, javascript, nodejs, node, react]
            from: 0
            to: 50

      - $css-skill
        type: skill
        title: CSS
        level: 5
        years: 10
        description: I love CSS
        tags: [css, css3, sass, less]

      - $leadership-skill
        type: skill
        title: Leadership
        level: 5
        years: 10
        description: I love leadership
        tags: [leadership, management, team, team management]

      - $tfy-senior-software-engineer
          type: position
          title: Senior Software Engineer
          company: Talentify
          location: Paris, France
          from: 2018-01-01
          to: 2019-01-01
          description: I was a senior software engineer at Talentify
          tags: [tfy, the family, startup, startup studio]
          links: [$tfy-senior-software-engineer-js-skill]
