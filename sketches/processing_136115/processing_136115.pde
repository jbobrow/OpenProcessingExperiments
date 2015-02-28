
RasterGroesse=5;
Ei[] Raster=new Ei[RasterGroesse];

void setup(){
    size(600,200);
    for(int i=0;i<RasterGroesse;i++){
        Raster[i]=new Ei(i*150+60,60);
    }
}

void draw(){


for(int i=0;i<RasterGroesse;i++){
    Raster[i].draw();
}
}

void mouseClicked(){
    for(int i=0;i<RasterGroesse;i++){
        if(Raster[i].isOver())Raster[i].countClick();
    }
}

class Ei{
    int xLoc=0;
    int yLoc=0;
    int Radius=50;
    int counter=0;
    color myColor=color(0,200,0);
    public Ei(int x,int y){
        xLoc=x;
        yLoc=y;
    }
    public void setColor(int r,int g,int b){
        myColor=color(r,g,b);
    }
    public boolean isOver(){
        if(dist(xLoc,yLoc,mouseX,mouseY)<Radius){
            return true;
        }else {
            return false;
        }
    }
    public void draw(){
        ellipseMode(CENTER);
        textAlign(CENTER,CENTER);
        textSize(30);
        fill(myColor);
        ellipse(xLoc,yLoc,Radius,Radius);
        fill(0);
        text(counter,xLoc,yLoc);
    }
    public void countClick(){
        counter++;
    }
}
