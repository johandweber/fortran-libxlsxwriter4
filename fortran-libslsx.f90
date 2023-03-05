module fortran_libslsx
  use iso_c_binding

  type, bind(c):: lxw_datetime
     integer(c_int):: year
     integer(c_int):: month
     integer(c_int):: day
     integer(c_int):: hour
     integer(c_int):: min
     real(c_double):: sec
  end type lxw_datetime

  enum, bind(c)
     enumerator:: LXW_FALSE
     enumerator:: LXW_TRUE
     enumerator:: LXW_EXPLICIT_FALSE
  end enum

  enum, bind(c)
     enumerator:: LXW_NO_ERROR
     enumerator:: LWX_ERROR_MEMORY_ALLOC_FAILED
     enumerator:: LXW_ERROR_CREATING_XLSX_FILE
     enumerator:: LXW_ERROR_CREATING_TMPFILE
     enumerator:: LXW_ERROR_CREATING_TMPFILE
     enumerator:: LXW_ERROR_CREATING_TMPFILE
     enumerator:: LXW_ERROR_ZIP_FILE_OPERATION
     enumerator:: LXW_ERROR_ZIP_PARAMETER_ERROR
     enumerator:: LXW_ERROR_ZIP_BAD_ZIP_FILE
     enumerator:: LXW_ERROR_ZIP_INTERNAL_ERROR
     enumerator:: LXW_ERROR_ZIP_FILE_ADD
     enumerator:: LXW_ERROR_ZIP_CLOSE
     enumerator:: LXW_ERROR_FEATURE_NOT_SUPPORTED
     enumerator:: LXW_ERROR_NULL_PARAMETER_IGNORED
     enumerator:: LXW_ERROR_PARAMETER_VALIDATION
     enumerator:: LXW_ERROR_SHEETNAME_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_INVALID_SHEETNAME_CHARACTER
     enumerator:: LXW_ERROR_SHEETNAME_START_END_APOSTROPHE
     enumerator:: LXW_ERROR_SHEETNAME_ALREADY_USED
     enumerator:: LXW_ERROR_32_STRING_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_128_STRING_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_255_STRING_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_MAX_STRING_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_SHARED_STRING_INDEX_NOT_FOUND
     enumerator:: LXW_ERROR_WORKSHEET_INDEX_OUT_OF_RANGE
     enumerator:: LXW_ERROR_WORKSHEET_MAX_URL_LENGTH_EXCEEDED
     enumerator:: LXW_ERROR_WORKSHEET_MAX_NUMBER_URLS_EXCEEDED
     enumerator:: LXW_ERROR_IMAGE_DIMENSIONS 
  end enum

  function workbook_new(filename)
    import c_ptr, c_char
    implicit none
    type(c_ptr) ::  workbook_new
    char(c_char) :: filename(*)
  end function workbook_new

  function workbook_add_worksheet(workbook, sheetname)
    import c_ptr, c_char
    implicit none
    type(c_ptr):: workbook_add_worksheet
    char(c_char):: sheetname(*)
  end function workbook_add_worksheet

  function workbook_write_string(worksheet, row, col string, cellformat)
    import c_ptr, c_char
    implicit none
    type(c_ptr)::  workbook_write_string
    type(c_ptr), value :: worksheet
    integer(c_int32_t) :: row
    integer(c_int16_t) :: col
    character(c_char)  :: string(*)
    type(c_ptr), value :: cellformat
  end function workbook_write_string

end module fortran_libslsx
