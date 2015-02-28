
HashMap font = new HashMap();
HashSet prs = new HashSet();



color[] colors = new color[5];

void setup(){
   size(250,250); 
   setupFont();
   float x = -30;
   //via http://www.colourlovers.com/palette/230000/ - not quite the usual green red black but nice
   colors[0] =  color(121,34,17);
   colors[1] =  color(238,200,75);
   colors[2] =  color(51,51,51);
   colors[3] =  color(90,59,38);
   colors[4] =  color(57,111,57);
   int c = 0;
  prs.add(new Principle("Umoja","Unity",x += 30,c++));
  prs.add(new Principle("Kujichagulia","Self-Determination",x += 30,c++));
  prs.add(new Principle("Ujima","Collective Work + Responsibility",x += 30,c++));
  prs.add(new Principle("Ujamaa","Cooperative Economics",x += 30,c++));
  prs.add(new Principle("Nia","Purpose",x += 30,c++));
  prs.add(new Principle("Kuumba","Creativity",x += 30,c++));
  prs.add(new Principle("Imani","Faith",x += 30,c++));

   
}

void draw(){
   background(200);
 
 Iterator i = prs.iterator();
 while(i.hasNext()){
    Principle p = (Principle ) i.next(); 
  p.move();
    p.draw();
 }
noStroke();
for(int j = 0; j < 5; j++){
  fill(colors[j]);
   rect(j*50,height*7/8-6,50,height/7+2);
}
 
}

class Principle{
  String word,  meaning;
  float basey;
  color c1,c2,c3,c4;
  float wordwidth,meaningwidth;
  float x,xs; 
  
    Principle(String word, String meaning, float y, int colorbase){
      this.word = word; this.meaning = meaning;
      basey = y;
      c1 = colors[colorbase%5];
      c2 = colors[(colorbase+2)%5];
      c3 = colors[(colorbase+4)%5];
      c4 = colors[(colorbase+3)%5];
   wordwidth = 9 * word.length();
   meaningwidth = 7 * meaning.length();
}  

void move(){
   if(mouseY > basey && mouseY < basey + (height/8) || mousePressed){
        xs = xs -5;
   } else {
     xs = xs + 1; 
   }
  
  
   xs *= .9;
  
   x = x + xs;
   if(x < -250) {x = -250; xs*=-1;}
   if(x > 0) {x = 0;xs*=-1;}

}

void draw(){
  noStroke();
  fill(c1);
  rect(x,basey,250,height/8);
  fill(c2);
  rect(x+250,basey,250,height/8);
  strokeWeight(2);
  stroke(c3);
  fontText(x+  ((250 - wordwidth) / 2),basey+8,word,9); 
  stroke(c4);
  fontText(x+ 250+  ((250 - meaningwidth) / 2),basey+8,meaning,7); 
}

}











void fontText(float x, float y, String s,float w){
  s = s.toUpperCase();
    for(int i = 0; i < s.length();i++){
       drawChar(s.substring(i,i+1),x,y,w-3,12);
      x += w; 
    }
}  

void setupFont(){
 font.put("0",new int[] {1,2,5,6,9,10,13,14});
font.put("1",new int[] {4,11} );
font.put("2",new int[] {1,6,8,7,9,14} );
font.put("3",new int[] {1,6,8,7,13,14} );
font.put("4",new int[] {2,7,8,6,13} );
font.put("5",new int[] {1,2,7,8,13,14} );
font.put("6",new int[] {1,2,7,8,13,14,9} );
font.put("7",new int[] {1,6,13} );
font.put("8",new int[] {1,2,6,7,8,9,13,14} );
font.put("9",new int[] {1,2,6,7,8,13,14} );
font.put("A",new int[] {9,2,1,6,13,7,8} );
font.put("B",new int[] {1,14,4,6,11,13,8} );
font.put("C",new int[] {1,2,9,14} );
font.put("D",new int[] {1,14,4,11,6,13} );
font.put("E",new int[] {1,2,7,9,14} );
font.put("F",new int[] {1,2,7,9} );
font.put("G",new int[] {1,2,9,14,13,8} );
font.put("H",new int[] {2,9,6,13,7,8} );
font.put("I",new int[] {1,4,11,14} );
font.put("J",new int[] {9,14,13,6} );
font.put("K",new int[] {2,9,7,5,12} );
font.put("L",new int[] {2,9,14} );
font.put("M",new int[] {9,2,3,5,6,13} );
font.put("N",new int[] {9,2,3,12,13,6} );
font.put("O",new int[] {1,2,9,14,13,6} );
font.put("P",new int[] {1,2,6,7,8,9} );
font.put("Q",new int[] {1,2,6,9,14,13,12} );
font.put("R",new int[] {1,2,6,7,8,9,12} );
font.put("S",new int[] {1,2,7,8,13,14} );
font.put("T",new int[] {1,4,11} );
font.put("U",new int[] {2,9,14,13,6} );
font.put("V",new int[] {2,9,10,5} );
font.put("W",new int[] {2,9,14,13,6,11} );
font.put("X",new int[] {3,10,5,12} );
font.put("Y",new int[] {3,5,11} );
font.put("Z",new int[] {1,5,10,14} );

font.put(" ",new int[] {} );
font.put(".",new int[] {0} );
font.put(",",new int[] {10} );
font.put("!",new int[] {4,11,0} );

font.put("?",new int[] {1,2,6,8,11,0} ); 
font.put("&",new int[] {1,3,6,8,9,12,14} ); 
font.put("+",new int[] {4,7,8,11} ); 
}

void drawChar(String c, float x, float y, float w, float h){

   int[] segs = (int[])font.get(c);
   if(segs == null) return;
   for(int i = 0; i < segs.length; i++){

      switch(segs[i]){
         case 1:
         line(x,y,x+w,y); break;
         case 2:
         line(x,y,x,y+(h/2));break;
         case 3:
         line(x,y,x+(w/2),y+(h/2));break;
         case 4:
         line(x+(w/2),y,x+(w/2),y+(h/2));break;
         case 5:
        line(x+w,y,x+(w/2),y+(h/2));  break;       
        case 6:
        line(x+w,y,x+w,y+(h/2));break;
         case 7:
          line(x,y+(h/2),x+(w/2),y+(h/2));break;
          case 8:
          line(x+(w/2),y+(h/2),x+w,y+(h/2));break;
          case 9:
          line(x,y+(h/2),x,y+h);break;
          case 10:
          line(x,y+h,x+w/2,y+h/2);break;
          case 11:
          line(x+w/2,y+h/2,x+w/2,y+h);break;
          case 12:
          line(x+w/2,y+h/2,x+w,y+h);break;
          case 13:
          line(x+w,y+h/2,x+w,y+h);break;
          case 14:
          line(x,y+h,x+w,y+h);break;
          case 0:
          line(x+w/2-w/6,y+h+h/6,x+w/2+w/6,y+h+h/6);break;
          
        default:
       break; 
      }
     
     
   }
}




