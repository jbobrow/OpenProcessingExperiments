
int [ ] xCoords = { 100, 200, 270 }; 
int [ ] yCoords = { 270, 200, 85 }; 
int [ ] dimensions = { 50, 70, 100 }; 
 
color [ ] colorListRect = { color( 200, 0, 0 ), // rect color 
 color( 0, 0, 200 ), 
 color( 0, 200, 0 ) 
 }; 
color [ ] colorListEllipse = { color( 200, 200, 0 ), // ellipse color 
 color( 0, 200, 200 ), 
 color( 200, 200, 0 ) 
 }; 
void setup( ) 
{ 
 size( 400, 400 ); 
 strokeWeight( 3 ); 
 ellipseMode( CORNER ); 
} 
 
void draw( ) 
{ 
 background( 200 ); 
 drawAllDesigns( ); 
 noLoop( ); 
}

void drawAllDesigns(){
 for (int i = 0; i < xCoords.length; i++){
   design (xCoords[i], yCoords[i], dimensions[i], colorListRect[i], colorListEllipse[i]);
 } 
}

void design ( int x, int y, int dim, color rec, color elip){
  fill(rec);
  rect(x,y,dim,dim);
  fill(elip);
  ellipse(x,y,dim/2,dim/2);
  line(x+dim, y, x, y+dim);
}


