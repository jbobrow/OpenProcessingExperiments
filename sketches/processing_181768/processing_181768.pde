
/** Click and drag either square to reposition it.
 */
/* "box_mouse_demo"
 *
 * This Applet requires that the "box" class be available, either at the end of this file, or
 * (as originally made available) in a second file (and a second tab in Processing). The "class"
 * box defines what a box *is* (what data it knows) and what a box *does* (what actions it 
 * knows how to do).
 *
 * This applet also uses MOUSE input, so it defines several new functions that get called by
 * the Processing world whenever the appropriate event occurs (e.g. "mousePressed" is called when
 * the user presses the mouse button).
 *
 *   - b.johnson
 *
 */

 box a, b, c, d;

 void setup(){
  size(300,300);
  a = new box( 100,200,20,200 );
  b = new box( 140,110,30,255 ); 
 }


 void mousePressed(){
   if( a.over() )a.select();
   if( b.over() )b.select();
 }

 void mouseReleased(){
   a.deselect();
   b.deselect();
 }

 void mouseDragged(){
  if( a.selected() )a.move(mouseX-pmouseX,mouseY-pmouseY);
  if( b.selected() )b.move(mouseX-pmouseX,mouseY-pmouseY); 
 }

 void draw(){
  background(150);
  a.display();
  b.display(); 
 }    
/*
 * Class 'box'
 *
 *
 */
 
class box{
 //     These are the things a box 'knows' (they're put up here to indicate that): 
 int xpos,ypos;    //  where it is, 
 int siz;          //  how big it is, what color it is, and 
 int col;          //  what color it is, and
 boolean sel;      //  whether it is selected. 
 
 
 //  When someone needs a box, they must "construct" it. This is the function that
 //  does that ... called the "constructor" 
 
  box( int x, int y, int s, int c ){
    this.xpos = x;   // the word "this" is not really needed here, but it indicates that "this box" 
    this.ypos = y;   // (the one being built by the constructor) is having it's knowledge initialized.
    this.siz = s;    // It does this, mostly, using values that the "user" provides. The exception is
    this.col = c;    // the "selection" value, which ALWAYS is false when the object is first made.
    this.sel=false;  // (not because it has to be, but because it makes sense for it to be).
  }
  
  
  // One thing our box better know how to do is display (draw) itself when told to. It does this by
  // making normal drawing-environment changes appropriate to the desired result.

  void display (){
    
    rectMode(CENTER);
    fill(col);
    if(this.sel) fill(100);
    rect( xpos,ypos,siz,siz );
  }
  
 // Another useful thing for the box to know is whether a particular test position (x,y)is "on top" of it.
 // Being a box, this basically means testing whether the test-x is between the left and right edges, and
 // whether the test-y is between bottom and top. If both of those things are true, the point is ON the box!

  boolean over(){
    int s2=siz/2;
    if( xpos-s2<mouseX && mouseX<xpos+s2 
       && ypos-s2<mouseY && mouseY<ypos+s2 ){return true;}
    return false;
  }
  
  // the box knows how to move itself a specified distance (basically it just updates it's position)
  
  void move(int dx, int dy){
   this.xpos += dx;
   this.ypos += dy; 
  }
  
  // and it knows how to become selected and deselected, and you can ask it if it is selected.
  
  void select(){
    this.sel=true;
  }
  
  boolean selected(){
    return this.sel;
  }
  
  void deselect(){
    this.sel=false;
  }
}

