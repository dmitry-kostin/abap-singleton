*&---------------------------------------------------------------------*
*& Report  Z_HELLO_SINGLETON
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  Z_HELLO_SINGLETON.


class zcl_singleton definition create private.
  public section.
    class-methods class_constructor.
    class-methods get_singleton
      returning value(re_ref_single) type ref to zcl_singleton.

  private section.
    class-data ref_single type ref to zcl_singleton.
endclass.

class zcl_singleton implementation.
  method class_constructor.
    create object ref_single.
  endmethod.

  method get_singleton.
    re_ref_single = ref_single.
  endmethod.
endclass.


start-of-selection.

data: obj type ref to zcl_singleton,
      obj2 type ref to zcl_singleton.

obj = zcl_singleton=>get_singleton( ).
obj2 = zcl_singleton=>get_singleton( ).


IF obj = obj2.
  write 'Success'.
ENDIF.
