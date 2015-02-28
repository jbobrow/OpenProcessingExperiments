
class BounceBox {
 
 float radius = 90;
 float bsize = 3;//b size means box size
 float zrot = 90;
 float yrot = 5;
 
 BounceBox() {
   
   
 };
 
 void update() {
   zrot += bsize/10;
   
 }
 void draw() {
   //Draw the box
   pushMatrix();
    rotateZ(zrot);
    rotateY(yrot);
    translate(radius,9);
    box(bsize);
   popMatrix();
 };
 
};
  


