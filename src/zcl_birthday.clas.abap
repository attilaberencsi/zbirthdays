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


    "Our age in days ?
    DATA(today) = cl_abap_context_info=>get_system_date( ).
    DATA(my_age_in_days) = today - co_my_birthday.
    DATA(my_brothers_age_in_days) = today - co_brothers_birthday.
    MESSAGE ID 'ZBIRTHDAY' TYPE 'I' NUMBER 001 WITH my_age_in_days INTO DATA(msg).
    out->write( |{ msg }| ).
    "out->write( |I am { my_age_in_days } days old.| ).
    MESSAGE ID 'ZBIRTHDAY' TYPE 'I' NUMBER 002 WITH my_brothers_age_in_days INTO msg.
    out->write( |{ msg }| ).
    "out->write( |My brother is { my_brothers_age_in_days } days old.| ).

    "How many nights until surprise ?
    DATA(my_birtyday_this_year) = CONV d( today(4) && co_my_birthday+4 ).
    IF my_birtyday_this_year > today.
      DATA(sleeps_until_birthday) = my_birtyday_this_year - today.
    ELSE.
      DATA(my_birtyday_next_year) = CONV d( |{ today(4) + 1 }{ co_my_birthday+4 }| ).
      sleeps_until_birthday = my_birtyday_next_year - today.
    ENDIF.
    MESSAGE ID 'ZBIRTHDAY' TYPE 'I' NUMBER 003 WITH sleeps_until_birthday INTO msg.
    out->write( |{ msg }| ).
    "out->write( |I have to sleep { sleeps_until_birthday } nights until my next birthday.| ).

    DATA(my_bros_birtyday_this_year) = CONV d( today(4) && co_brothers_birthday+4 ).
    IF my_bros_birtyday_this_year > today.
      sleeps_until_birthday = my_bros_birtyday_this_year - today.
    ELSE.
      my_bros_birtyday_this_year = CONV d( |{ today(4) + 1 }{ co_brothers_birthday+4 }| ).
      sleeps_until_birthday = my_bros_birtyday_this_year - today.
    ENDIF.
    MESSAGE ID 'ZBIRTHDAY' TYPE 'I' NUMBER 004 WITH sleeps_until_birthday INTO msg.
    out->write( |{ msg }| ).
    "out->write( |My brother have to sleep { sleeps_until_birthday } nights until his next birthday.| ).

  ENDMETHOD.

ENDCLASS.
