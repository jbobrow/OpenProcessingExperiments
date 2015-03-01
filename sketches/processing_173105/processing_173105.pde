

class Point{
  int x,y;
  color myColor;
  Point(int x,int y,color colore){
    this.x=x; this.y=y;
    myColor=colore;
  }

}


color[] colors;
Point[] points;
int last;

void setup(){
  size(300,300);
  background(0);

  colors=new color[20];
  for(int i=0;i<20;i++)
     colors[i]=color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256)); 

  last=0;
  points=new Point[20];
}


color nearestColor(int x,int y){
  double minDist=width*height+1;
  int minInd=-1;
  for(int f=0;f<20;f++){
   if(points[f]==null)
      break;
   double actual=Math.sqrt(Math.pow(x-points[f].x,2)+Math.pow(y-points[f].y,2));
   if(actual<minDist){
       minDist=actual;
       minInd=f;
   } 
  }

  return points[minInd].myColor;

}

void mousePressed(){
    points[last%20]=new Point(mouseX,mouseY,colors[last++%20]);

    loadPixels();
    for(int indP=0;indP<width*height;indP++){
        int yCord=(int)Math.floor(indP/width);
        int xCord=(int)indP-yCord*width;
        pixels[indP]=nearestColor(xCord,yCord);
    }
    updatePixels();
}


void draw(){
  ellipseMode(CENTER);

  for(int j=0;j<points.length;j++){
    if(points[j]==null)
      break;
    fill(points[j].myColor);
    ellipse(points[j].x,points[j].y,10,10);  
  }

}


