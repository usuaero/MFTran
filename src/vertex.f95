! Types for geometric objects
module vertex_mod

    implicit none


    type vertex
        ! A vertex in 3-space

        real,dimension(3) :: loc, cp ! Location and associated control point
        logical :: on_kutta_edge
        integer,dimension(20) :: neighboring_panels = -1
        integer :: index ! Index of this vertex in the mesh

        contains

            procedure :: init => vertex_init

    end type vertex


    type vertex_pointer
        ! A pointer to a vertex, for creating vertex arrays

        type(vertex),pointer :: ptr

    end type vertex_pointer

    
contains


    subroutine vertex_init(this, loc, index)
        ! Initializes a vertex

        implicit none

        class(vertex),intent(inout) :: this
        real,dimension(3),intent(in) :: loc
        integer,intent(in) :: index

        ! Store info
        this%loc = loc
        this%index = index

    end subroutine vertex_init
    
end module vertex_mod