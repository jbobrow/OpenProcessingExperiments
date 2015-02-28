
import interfascia.*;

GUIController c;
IFTextField t;
IFLabel l;
String [] lines;
String b = "1924";
PFont font;

void setup() {
  size(500, 200);
  background(175,0,5,40);
  
  c = new GUIController(this);
  t = new IFTextField("Text Field", (width/2)-75, (height/2)-20, 150);
  l = new IFLabel("", (width/2)-75, height/2+15);
  
  c.add(t);
  c.add(l);
  
  t.addActionListener(this);
  
  
  

}

void draw() {
 // String lines[] = loadStrings("chineseaspects2.txt");
  //for(int i=0; i<lines.length; i++){
    //println(lines[i]);
 //String lines[] = loadStrings("chineseaspects2.txt");
  //for(int i=0; i<lines.length; i++){
    //text(lines[0],0,15);
  //}
 // }
  
}

void actionPerformed(GUIEvent e) {
  background(175,0,5,40);
  if (e.getMessage().equals("Completed")) {
    l.setLabel(t.getValue());
      //println ("Message: " + t.getValue());
      String s = t.getValue();
      println(s);
   if(int(s)>1923 && int(s)<2044){
     String lines[] = loadStrings("chineseaspects3.txt");
     for(int i=0; i<lines.length; i++){
       font = loadFont("TwCenMT-Regular-20.vlw"); 
      textFont(font); 
     
    text(lines[int(s)-1924],10,20);
   loop();
  }
   }
  }
}
    /*  
       if(float(s) == 1924){
    String lines[] = loadStrings("chineseaspects2.txt");
  for(int i=0; i<lines.length; i++){
    text(lines[0],0,20);
  }
  }
    else if (float(s) == 1925){
      //String lines[] = loadStrings("chineseaspects2.txt");
//  for(int i=0; i<lines.length; i++){
      text(lines[1],50,50);
    }
    }
  }
//}
*/

/*void display(){
  if(t.getValue()== "1924"){
    String lines[] = loadStrings("chineseaspects2.txt");
  for(int i=0; i<lines.length; i++){
    text(lines[0],0,0);
  }
  }
    else {
      text(lines[1],50,0);
    }
  }
  */

