#import "template.typ": *

#show: project.with(
  title: "doc", 
  subtitle: "HEIG-VD - template", 
  authors: ("Christophe",)
)

#set table(
  inset: 5pt,
  align: horizon,
)

#show table: it => [
  #set align(center)
  #it
]

= Title