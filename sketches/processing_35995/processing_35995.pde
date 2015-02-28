
size(500, 500);
background(#FFCB86);
smooth ();

fill (#8E5203);
ellipse (250, 200, 300, 300);

//eyeballs
fill (#FFF7FB);
ellipse (210, 160, 60, 60);
ellipse (280, 160, 60, 60);

//pupils
fill (#000000);
ellipse (210, 160, 15, 15);
ellipse (280, 160, 15, 15);

//nose
fill (#000000);
ellipse (230, 210, 30, 30);
ellipse (260, 210, 30, 30);
ellipse (245, 220, 30, 30);

//mouth 
fill (#F5F4F2);
bezier (205, 245, 205, 300, 285, 300, 285, 245);
line (205, 245, 285, 245);
line (245, 245, 245, 285);

//ears 
fill (#8E5203);
bezier (112, 142, 12, 115, 106, 42, 130, 110);
bezier (388, 142, 460, 115, 430, 42, 360, 98);
                
