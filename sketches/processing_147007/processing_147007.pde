
  void setup() {
    size(400,400);
    noLoop();            // turn off animation, since we won't need it
    //stroke(#FFEE88);
    //fill(#FFEE88);
    background(#A4A4A0);
    //background(#FFFFFF);
    text("",0,0);          // force Processing to load a font
    textSize(24);          // set the font size to something big
    
   /*
    String t = "wwwts 15 0 40,wwwty 20 55 40,wwwty 25 125 40,wwwty 30 210 40,wwwtr 35 310 40,wwwtd 40 0 80";
    String[] rootlist = splitTokens(t, ",");
    for (int i = 0; i < rootlist.length; i++) {
         String[] list = split(rootlist[i], " ");
         fill(#FFEE88); 
         textSize(float(list[1]));
         text(list[0],float(list[2]), float(list[3]));         
         println(list[0] + " " + list[1] + " " + list[2] + " " + list[3] + " " + list[4]  );
       }
      
      */
  }
  

  void draw() {
    /*
    String t = "my 111 30 40 40,words 222 26 40 80,your 122 30 40 120,thought 144 26 40 160";
    String[] rootlist = splitTokens(t, ",");
    for (int i = 0; i < rootlist.length; i++) {
         String[] list = split(rootlist[i], " ");
         fill(int(list[1])); 
         textSize(float(list[2]));
         text(list[0],float(list[3]), float(list[4]));         
         println(list[0] + " " + list[1] + " " + list[2] + " " + list[3] + " " + list[4]  );
       }
 */
  }
   /*
  void drawText(String t)
  {
    
    
   
    String[] rootlist = splitTokens(t, ",");
    for (int i = 0; i < rootlist.length; i++) {
         String[] list = split(rootlist[i], " ");
         fill(int(list[1]), int(list[2]), int(list[3]));
         textSize(float(list[4]));
         text(list[0],float(list[5]), float(list[6]));         
         println(list[0] + " " + list[1] + " " + list[2] + " " + list[3] + " " + list[4]  +" " + list[5] + " " + list[6] );
       }
     //background(#000033);
     //textSize(84);
     //text(t,10, 50);
    
  }
   */
   
  void drawText(String t)
  {
  //String t = "my 5 40 40,words 15 40 80,your 15 40 120,thought 25 40 160";
  background(#A4A4A0);
    String[] rootlist = splitTokens(t, ",");
    for (int i = 0; i < rootlist.length; i++) {
         String[] list = split(trim(rootlist[i]), " ");
         fill(139, 0, 0);
         string fSize =float(list[1]); 
         if(fSize<6)
              fSize=5;
         else if(fSize<11)
              fSize=10;
         else if(fSize<16)
              fSize=15;
         else if(fSize<21)
              fSize=20;
        else if(fSize<26)
              fSize=25;
        else 
              fSize=30;
         textSize(float(fSize));
         //textAlign(CENTER);
         text(list[0],float(list[2]*18), float(list[3]*20));         
         println(list[0] + " " + fSize + " " + list[2] + " " + list[3]  );
       }
     //background(#000033);
     //textSize(84);
     //text(t,10, 50);
    
  }
  void mouseClicked() {
      println (mouseX +"," + mouseY);
      }
