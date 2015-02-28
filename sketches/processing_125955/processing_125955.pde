
import java.util.*;

int counter;
ArrayList<IconWithHandle> pList=new ArrayList<IconWithHandle>();
boolean wasDragging=false;

void setup() {  //setup function called initially, only once
  size(600, 500);
  counter = 0;
  for(int i=0;i<6;i++){
      for(int j=0;j<5;j++){
          pList.add(new IconWithHandle(30+60*i,30+70*j,40,60));
      }
  }
}

void draw() {  //draw function loops 
  background(100,100,200);  //set background white
  int dragIcon=-1;
  int i=0;
  for(IconWithHandle r0:pList){
      if(r0.getBeingDragged()) dragIcon=i;
      else r0.draw();
      i++;
  }
  if(dragIcon>=0)pList.get(dragIcon).draw();
}

void mouseDragged(){
    for(IconWithHandle r0:pList){
        if(r0.getBeingDragged()){
            r0.dragTo(mouseX,mouseY);
            return;
        }
    }
     if(!wasDragging) {
        for(IconWithHandle r0:pList){
           if(r0.isOver(mouseX,mouseY)){r0.setBeingDragged(true);
            wasDragging=true;
            return;
            }
        }
    }
}

void mouseEntered(){
    mouseReleased();
}

void mouseMoved(){
}

void mouseReleased(){
    for(IconWithHandle r0:pList){
        r0.setBeingDragged(false);
    }
    wasDragging=false;
}

void mouseClicked(){
    for(IconWithHandle r0:pList){
    if(r0.isInClickArea(mouseX,mouseY))r0.registerClick();
    }
}

public interface Clickable{
    public boolean isInClickArea(int inX,int inY);
    public void registerClick();
}

public interface Interactive{
    public boolean isOver(int inX,int inY);
    public void draw();
} 

public interface Draggable{
    public void setBeingDragged(boolean value);
    public boolean getBeingDragged();
    public void dragTo(int inX,int inY);
    public PVector getPosition();
    public void setPosition(int inX,int inY);
    public boolean isInDragArea(int inX,int inY);
}

public class DraggableRect implements Draggable,Interactive{
    private int x,y,w,h,dx,dy;
    private boolean dragging=false;
    protected int strokeColor=color(20,20,20);
    public DraggableRect(int xLoc,int yLoc,int xSize,int ySize){
        setPosition(xLoc,yLoc);
        w=xSize;
        h=ySize;
    }
    public void dragTo(int inX,int inY){
        setPosition(inX-dx,inY-dy);
    }
    public PVector getPosition(){
        return new PVector(x,y);
    }
    public void setPosition(int inX,int inY){
        x=inX;
        y=inY;
    }
    public boolean getBeingDragged(){
        return dragging;
    }
    public void setBeingDragged(boolean value){
        dragging=value;
        if(dragging){
            dx=mouseX-x;
            dy=mouseY-y;
        }
    }
    public void draw(){
        strokeWeight(2);
        fill(200,200,0);
        pushMatrix();
        rectMode(CORNER);
        stroke(strokeColor);
        rect(x,y,w,h);
        popMatrix();
    }
    public boolean isOver(int inX,int inY){
        return (inX>x&&inX<x+w&&inY>y&&inY<y+h);
    }
    public boolean isInDragArea(int inX, int inY){
        return isOver(inX,inY);
    }
}

public class IconWithHandle extends DraggableRect implements Clickable{
    private Button[] popups=new Button[0];
    public IconWithHandle(int xLoc,int yLoc,int xSize,int ySize){
        super(xLoc,yLoc,xSize,ySize);
    }
    public void draw(){
        super.draw();
        fill(0);
        pushMatrix();
        translate(x+0.92*w,y+0.92*h);
        ellipseMode(CENTER);
        stroke(20,20,20);
        fill(220);
        ellipse(0,0,14,14);
        popMatrix();
    }
    public boolean isOver(int inX,int inY){
        return dist(x+0.92*w,y+0.92*h,inX,inY)<15;
    }
    public boolean isInClickArea(int inX,int inY){
        if(super.isOver(inX,inY)&&!isInDragArea(inX,inY)) return true;
    }
    public void registerClick(){
        if(strokeColor==color(20,20,20))strokeColor=color(200,20,80);else strokeColor=color(20,20,20);
        return;
    }
}

