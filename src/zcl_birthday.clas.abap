"! <p class="shorttext synchronized" lang="en">Birthday Calculations with Children</p>
CLASS zcl_birthday DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_birthday IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "This is a programming playground with the children together.
    "Children wanted to know how old are they, but most importantly
    "how many days are left until their birthday ? :).
    "Some feature requested by the children,because they want translation;
    "This comes next :),I told them ABAP has built-in multi-language support for decades :D

    CONSTANTS:
      co_my_birthday       TYPE d VALUE '20140404',
      co_brothers_birthday TYPE d VALUE '20170521'.


    DATA(my_age_in_days) = cl_abap_context_info=>get_system_date( ) - co_my_birthday.

    out->write( |I am { my_age_in_days } days old.| ).

    DATA(my_brothers_age_in_days) = cl_abap_context_info=>get_system_date( ) - co_brothers_birthday.

    out->write( |My brother is { my_brothers_age_in_days } days old.| ).

  ENDMETHOD.

ENDCLASS.
