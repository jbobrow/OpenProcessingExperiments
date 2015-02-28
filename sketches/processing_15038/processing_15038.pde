
import java.awt.*; 

class GameKeyboard implements KeyEventDispatcher
{
  boolean up=false;
    boolean down=false;
      boolean right=false;
        boolean left=false;
        boolean space=false;
        boolean a=false;
                boolean s=false;
                        boolean d=false;
                                boolean w=false;
             boolean i=false;
                boolean j=false;
                        boolean k=false;
                                boolean l=false;


  GameKeyboard()
  {
  KeyboardFocusManager.getCurrentKeyboardFocusManager()
    .addKeyEventDispatcher(this);
  }

  public boolean dispatchKeyEvent( KeyEvent ke )
  {

 if(ke.getKeyCode()==UP && ke.getID()==401){
up=true;
 }
  if(ke.getKeyCode()==UP && ke.getID()==402){
up=false;
 }
  if(ke.getKeyCode()==DOWN && ke.getID()==401){
down=true;
 }
  if(ke.getKeyCode()==DOWN && ke.getID()==402){
down=false;
 }
 
 
  if(ke.getKeyCode()==RIGHT && ke.getID()==401){
right=true;
 }
  if(ke.getKeyCode()==RIGHT && ke.getID()==402){
right=false;
 }
 
  
  if(ke.getKeyCode()==LEFT && ke.getID()==401){
left=true;
 }
  if(ke.getKeyCode()==LEFT && ke.getID()==402){
left=false;
 }
   if(ke.getKeyChar()== 'a' && ke.getID()==401){
a=true;
 }
    if(ke.getKeyChar()== 'a' && ke.getID()==402){
a=false;
 }
    if(ke.getKeyChar()== 'd' && ke.getID()==401){
d=true;
 }
    if(ke.getKeyChar()== 'd' && ke.getID()==402){
d=false;
 }
    if(ke.getKeyChar()== 's' && ke.getID()==401){
s=true;
 }
    if(ke.getKeyChar()== 's' && ke.getID()==402){
s=false;
 }
    if(ke.getKeyChar()== 'w' && ke.getID()==401){
w=true;
 }
    if(ke.getKeyChar()== 'w' && ke.getID()==402){
w=false;
 }

    if(ke.getKeyChar()== 'j' && ke.getID()==401){
                          j=true;
 }
    if(ke.getKeyChar()== 'j' && ke.getID()==402){
                          j=false;
 }
    if(ke.getKeyChar()== 'l' && ke.getID()==401){
                          l=true;
 }
    if(ke.getKeyChar()== 'l' && ke.getID()==402){
                          l=false;
 }
    if(ke.getKeyChar()== 'k' && ke.getID()==401){
                          k=true;
 }
    if(ke.getKeyChar()== 'k' && ke.getID()==402){
                          k=false;
 }
 
     if(ke.getKeyChar()== 'i' && ke.getID()==401){
                          i=true;
 }
    if(ke.getKeyChar()== 'i' && ke.getID()==402){
                          i=false;
 }
 
 
 
 // CAPS LOCK *******************************************
 
    if(ke.getKeyChar()== 'A' && ke.getID()==401){
a=true;
 }
    if(ke.getKeyChar()== 'A' && ke.getID()==402){
a=false;
 }
    if(ke.getKeyChar()== 'D' && ke.getID()==401){
d=true;
 }
    if(ke.getKeyChar()== 'D' && ke.getID()==402){
d=false;
 }
    if(ke.getKeyChar()== 'S' && ke.getID()==401){
s=true;
 }
    if(ke.getKeyChar()== 'S' && ke.getID()==402){
s=false;
 }
    if(ke.getKeyChar()== 'W' && ke.getID()==401){
w=true;
 }
    if(ke.getKeyChar()== 'W' && ke.getID()==402){
w=false;
 }

    if(ke.getKeyChar()== 'J' && ke.getID()==401){
                          j=true;
 }
    if(ke.getKeyChar()== 'J' && ke.getID()==402){
                          j=false;
 }
    if(ke.getKeyChar()== 'L' && ke.getID()==401){
                          l=true;
 }
    if(ke.getKeyChar()== 'L' && ke.getID()==402){
                          l=false;
 }
    if(ke.getKeyChar()== 'K' && ke.getID()==401){
                          k=true;
 }
    if(ke.getKeyChar()== 'K' && ke.getID()==402){
                          k=false;
 }
 
     if(ke.getKeyChar()== 'I' && ke.getID()==401){
                          i=true;
 }
    if(ke.getKeyChar()== 'I' && ke.getID()==402){
                          i=false;
 }
     if(ke.getKeyChar()== ' ' && ke.getID()==401){
space=true;
 }
    if(ke.getKeyChar()== ' ' && ke.getID()==402){
space=false;
 }
    ke.consume();
return true;
  }//dispatcher
  
  
  void display(){
   text("left "+left,40,140); 
      text("right "+right,300,140); 
         text("up "+up,150,100); 
            text("down "+down,150,140); 
    translate(0,100);
       text("a "+a,40,140); 
      text("d "+d,300,140); 
         text("w "+w,150,100); 
            text("s "+s,150,140); 
                translate(0,100);
       text("j "+j,40,140); 
      text("l "+l,300,140); 
         text("i "+i,150,100); 
            text("k "+k,150,140); 
  }
}//class






