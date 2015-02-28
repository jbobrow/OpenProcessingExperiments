
void setup()
{
    background(255,255,255);
  size(600,800,P3D);      
}
float i=0,j=0,zindex=5;
float angle=(PI/180)*1,majorangle=(PI/180)*1;
float radiuscontrol=(PI/180)*0.5;
float coord_x=0,coord_y=0;
void draw()
{
    coord_x=50;
    coord_y=50;
//  background(255,255,255);  
    ellipse(coord_x*cos(angle+PI)+300, (coord_y*sin(angle+PI)+i)/zindex, (10)*sin(radiuscontrol-(PI/4)), (10)*sin(radiuscontrol-(PI/4)));
    ellipse(coord_x*cos(angle)+300, (coord_y*sin(angle)+i)/zindex, (10)*sin(radiuscontrol-(PI/4)), (10)*sin(radiuscontrol-(PI/4)));
    angle=angle+(PI/180)*1;
    radiuscontrol=radiuscontrol+(PI/180)*1;    
    i=i+5;
    if((i%20)==0)
    {
      line(coord_x*cos(angle+PI)+300, (coord_y*sin(angle+PI)+i)/zindex,coord_x*cos(angle)+300, (coord_y*sin(angle)+i)/zindex);
    }
    majorangle=majorangle+(PI/180)*1;    
}

