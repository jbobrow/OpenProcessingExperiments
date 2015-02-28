
void setup() {
size(800, 600);


}
PImage main= loadImage("surf_main.jpg");
PImage bg3 = loadImage("bg3.jpg");
PImage stat = loadImage("stat.jpg");



int bg=0;
int bg2=0;
int bg4=0;
int bg5=0;
int bg6=0;
int bg7=0;
int bg8=0;
int bg9=0;
int bg10=0;
void draw()
{
 
 if(bg==0){
   background(main);
 }


 
 
 
  println(frameCount);
 
 

 







   
    if(mouseX<380 || mouseX>460 || mouseY<450 || mouseY>495){
      fill(10,188,135);
  
    }
    else{
      fill(5,72,248);
      mPressed1();
       
    }
   
  if(bg==0){
    rect(380, 450, 80, 45);
    fill(255,255,255);
    textSize(18);
    text("Start ", 401.5, 476);  
  }
////////////////

if(mouseX<85.5 || mouseX>210 || mouseY<546 || mouseY>556){
      fill(10,188,135);
  
    }
    else{
      fill(5,72,248);
      mPressed2();
      if(mouseX<220 || mouseX>290 || mouseY<15 || mouseY>25){
      fill(0);
  
      }
      
       if(bg5==1 && bg2==1){
        fill(0);
        rect(380, 450, 80, 45);
        fill(255,255,255);
        textSize(18);
        text("Back", 401.5, 476);
      }
       
    }
    
    
////////////////////////
  if((mouseX<85.5 || mouseX>210 || mouseY<546 || mouseY>556) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Watergate Bay ", 85.5, 556);
        fill(10,188,135);
        rect(200, 546, 10, 10);
      }  
  }
  
  
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Watergate Bay ", 85.5, 556);
        fill(5,72,248);
        rect(200, 546, 10, 10);
      }
    }
if(mouseX<246 || mouseX>380 || mouseY<285 || mouseY>295){
      fill(10,188,135);
  
    }
    else{
        fill(5,72,248);
        mPressed3();
        fill(0);
        if(bg4==1 && bg2==1){
        rect(380, 450, 80, 45);
        fill(255,255,255);
        textSize(18);
        text("Back", 401.5, 476);
      }
    }
    
    

  
  //////////////////////  
    if((mouseX<246 || mouseX>380 || mouseY<285 || mouseY>295) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Saltburn Beach ", 246, 295);
        fill(10,188,135);
        rect(370, 285, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Saltburn Beach ", 246, 295);
        fill(5,72,248);
        rect(370, 285, 10, 10);
      }
    }
    
///////////////////////////

    
 
//////////////////////////////


    
    if((mouseX<230 || mouseX>321 || mouseY<190 || mouseY>200) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Pease Bay ", 230, 200);
        fill(10,188,135);
        rect(311, 190, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Pease Bay ", 230, 200);
        fill(5,72,248);
        rect(311, 190, 10, 10);
        
         mPressed4();
         if(bg6==1 && bg2==1){
          fill(0);
          rect(380, 450, 80, 45);
          fill(255,255,255);
          textSize(18);
          text("Back", 401.5, 476);
         }
      }
    }
    
/////////






 if((mouseX<135 || mouseX>240 || mouseY<480 || mouseY>490) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Llangennith ", 135, 490);
        fill(10,188,135);
        rect(230, 480, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Llangennith ", 135, 490);
        fill(5,72,248);
        rect(230, 480, 10, 10);
        mPressed5();
         if(bg7==1 && bg2==1){
          fill(0);
          rect(380, 450, 80, 45);
          fill(255,255,255);
          textSize(18);
          text("Back", 401.5, 476);
         }
      }
    }

////////////////


if((mouseX<168 || mouseX>250 || mouseY<565 || mouseY>575) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Bantham ", 168, 576);
        fill(10,188,135);
        rect(240, 565, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Bantham ", 168, 576);
        fill(5,72,248);
        rect(240, 565, 10, 10);
        mPressed6();
         if(bg8==1 && bg2==1){
          fill(0);
          rect(380, 450, 80, 45);
          fill(255,255,255);
          textSize(18);
          text("Back", 401.5, 476);
         }
      }
    }
    
 ////////////////////////////   
    
if((mouseX<220 || mouseX>335 || mouseY<535 || mouseY>545) && bg==1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Bournemouth ", 220, 545);
        fill(10,188,135);
        rect(325, 535, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Bournemouth ", 220, 545);
        fill(5,72,248);
        rect(325, 535, 10, 10);
        mPressed7();
         if(bg9==1 && bg2==1){
          fill(0);
          rect(380, 450, 80, 45);
          fill(255,255,255);
          textSize(18);
          text("Back", 401.5, 476);
         }
      }
    }    
    
/////////////////////////

if((mouseX<220 || mouseX>290 || mouseY<15 || mouseY>25) && bg==1&& bg2!=1 && bg2!=1){
      
      if(bg==1){
        
        fill(0);
        textSize(16);
        text("Thurso ", 220, 25);
        fill(10,188,135);
        rect(280, 15, 10, 10);
      }  
  }
    else{
      
      if(bg==1 && bg2!=1){
        fill(0);
        textSize(16);
        text("Thurso ", 220, 25);
        fill(5,72,248);
        rect(280,15, 10, 10);
        mPressed8();
         if(bg10==1 && bg2==1){
          fill(0);
          rect(380, 450, 80, 45);
          fill(255,255,255);
          textSize(18);
          text("Back", 401.5, 476);
         }
      }
    }    
    










    
    
}

void mPressed1(){
    if (mousePressed == true) {
      fill(0);
      background(bg3);
      bg=1;
      bg2=0;
       
  }
}

void mPressed2(){
   if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg5=1;
      dataWeb1();
  }
}

void mPressed3(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg4=1;
       dataWeb2();
  }
}

void mPressed4(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg6=1;
       dataWeb3();
  }
}

void mPressed5(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg7=1;
       dataWeb4();
  }
}

void mPressed6(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg8=1;
       dataWeb5();
  }
}

void mPressed7(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg9=1;
       dataWeb6();
  }
}

void mPressed8(){
    if (mousePressed == true) {
      fill(0);
      background(stat);
      bg2=1;
      bg10=1;
       dataWeb7();
  }
}


String dataWeb1(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/961/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
                          
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Watergate Bay:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   
  
return ppp;














}
















String dataWeb2(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/24/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Saltburn Beach:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}


String dataWeb3(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/28/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Pease Bay:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}


String dataWeb4(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/32/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Llangennith:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}

String dataWeb5(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/10/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Bantham:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}

String dataWeb6(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/12/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Bournemouth:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}

String dataWeb7(){

    float bit;
  int y;
  float x = 0;
  String[] hr1;
  String[] hr2;
  String[] hr3;
  String[] hr4;
  String[] hr5;
  String[] hr6;
  String[] hr7;
  String[] hr8;
  String[] hr9;
  



String[] page = loadStrings("http://magicseaweed.com/Saltburn-Beach-Surf-Report/47/");
 
    // initilise a new string variable to put the page into
    String p = "";
    String p1 = "";

    //for every line
   
    
    for (int i=0;i<page.length;i++) {
      p += page[i];
    }
    
    
    
    String startMarker = "msw-tide-table table table-condensed table-striped";
    String endMarker = "</tbody>";
    int start = p.indexOf(startMarker);
    p = p.substring(start+startMarker.length(), p.length());
    int end = p.indexOf(endMarker);
    String ss = p.substring(0, end);
 
 
    String[] list1 = split(ss, "/td");
    hr1 = list1[1].split(">");
    hr1 = hr1[2].split("<");


    String[] list2 = split(ss, "/td>");
    hr2 = list2[2].split(">");
    hr2 = hr2[1].split("<");
    
    String[] list3 = split(ss, "/td>");
    hr3 = list3[4].split(">");
    hr3 = hr3[1].split("<");
   
    
    String[] list4 = split(ss, "/td>");
    hr4 = list4[5].split(">");
    hr4 = hr4[1].split("<");
    
    String[] list5 = split(ss, "/td>");
    hr5 = list5[7].split(">");
    hr5 = hr5[1].split("<");
    
    String[] list6 = split(ss, "/td>");
    hr6 = list6[8].split(">");
    hr6 = hr6[1].split("<");
   
    String[] list7 = split(ss, "/td>");
    hr7 = list7[10].split(">");
    hr7 = hr7[1].split("<");
    
    String[] list8 = split(ss, "/td>");
    hr8 = list8[11].split(">");
    hr8 = hr8[1].split("<");
 
   String ppp=hr1[0];
   fill(255,255,255);
   textSize(22);
   text("Thurso:", 25, 250);
   text("   "+hr1[0]+"   :  "+ hr2[0], 0, 280);
   text("   "+hr3[0]+"  :  "+ hr4[0], 0, 310);
   text("   "+hr5[0]+"   :  "+ hr6[0], 0, 340);
   text("   "+hr7[0]+"  :  "+ hr8[0], 0, 370);
 
  
return ppp;

}




