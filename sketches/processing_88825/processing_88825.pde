
float y;
int x;
color group1 = color(#41F24D); //0%-5%
color group2 = color(#1DBF28); //6%-11%
color group3 = color(#00960A); //12%-17%
color group4 = color(#006106); //18%-23%
color group5 = color(#003804); //24%-29%

void setup() {
  size(610, 650);
  smooth();
  stroke(255);
  background(255);
  fill(150);
  text("%", 15, 640);
  fill(group1);
  rect(50, 627, 15, 15);
  fill(150);
  text("0-5", 73, 640);
  fill(group2);
  rect(160, 627, 15, 15);
  fill(150);
  text("6-11", 182, 640);
  fill(group3);
  rect(280, 627, 15, 15);
  fill(150);
  text("12-17", 302, 640);
  fill(group4);
  rect(400, 627, 15, 15);
  fill(150);
  text("18-23", 422, 640);
  fill(group5);
  rect(520, 627, 15, 15);
  fill(150);
  text("24-29", 542, 640);
      fill(150);
    text("J", 2, 60);
    text("A", 2, 110);
    text("S", 2, 160);
    text("O", 2, 210);
    text("N", 2, 260);
    text("D", 2, 310);
    text("J", 2, 360);
    text("F", 2, 410);
    text("M", 2, 460);
    text("A", 2, 510);
    text("M", 2, 560);
    text("J", 2, 610);
  text("2007-2008", 45, 12);
  text("2008-2009", 165, 12);
  text("2009-2010", 285, 12);
  text("2010-2011", 405, 12);
  text("2011-2012", 522, 12);
  
}

void draw() {
//2007-2008
  for(int i = 0; i < 12; i++) {
    y = i*(height/13)+15;
    x=15;
    fill(group1);
    rect(x, y, 120, 50);

         //August 07
    fill(group2);
    rect(x, (height/13)*1+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 65) {
        if (mouseY < 115) {
            fill(255);
            text("$4,714", x+5, 95);
        }}} else {
         }
         //September 07
    fill(group2);
    rect(x, (height/13)*2+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 115) {
        if (mouseY < 165) {
            fill(255);
            text("$3,095", x+5, 145);
        }}} else {
         }
         //October 07
    fill(group3);
    rect(x, (height/13)*3+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 165) {
        if (mouseY < 215) {
            fill(255);
            text("$7,606", x+5, 195);
        }}} else {
         }
         //November 07
    fill(group4);
    rect(x, (height/13)*4+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 215) {
        if (mouseY < 265) {
            fill(255);
            text("$10,311", x+5, 245);
        }}} else {
         }
         //January 08
    fill(group3);
    rect(x, (height/13)*6+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 315) {
        if (mouseY < 365) {
            fill(255);
            text("$7,455", x+5, 345);
        }}} else {
         }
        // February 08
    fill(group2);
    rect(x, (height/13)*7+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 365) {
        if (mouseY < 415) {
            fill(255);
            text("$5,971", x+5, 395);
        }}} else {
         }
    //April 08
    fill(group2);
    rect(x, (height/13)*9+15, 120, 50);
        if (mouseX < 120){
        if (mouseY > 465) {
        if (mouseY < 515) {
            fill(255);
            text("$4,032", x+5, 495);
        }}} else {
         }
         //May 08
        if (mouseX < 120){
        if (mouseY > 515) {
        if (mouseY < 565) {
            fill(255);
            text("$2,877", x+5, 545);
        }}} else {
         }
    //June 08
//    fill(group1);
 //   rect(x, (height/13)*11, 120, 50);
        if (mouseX < 120){
        if (mouseY > 565) {
        if (mouseY < 615) {
            fill(255);
            text("$2,200", x+5, 595);
        }}} else {
         }

  } 
          //July 2007
        if (mouseX < 120){
        if (mouseY > 15) {
        if (mouseY < 65) {
            fill(255);
            text("$650", x+5, 45);
        }}} else {
         }
 //December 07
//    fill(group1);
//    rect(x, (height/13)*5, 120, 50);
        if (mouseX < 120){
        if (mouseY > 265) {
        if (mouseY < 315) {
            fill(255);
            text("$1,125", x+5, 295);
        }}} else {
         }
                  //March 08
 //   fill(group1);
  //  rect(x, (height/13)*8, 120, 50);
        if (mouseX < 120){
        if (mouseY > 415) {
        if (mouseY < 465) {
            fill(255);
            text("$2,750", x+5, 445);
        }}} else {
         }
  //2008-2009      
  for(int i = 0; i < 12; i++) {
    y = i*(height/13)+15;
    x=((width/5)*1)+12;
    fill(group1);
    rect(x, y, 120, 50);
         //October08
    fill(group2);
    rect(x, (height/13)*3+15, 120, 50); 
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 165) {
        if (mouseY < 215) {
            fill(255);
            text("$2,551", x+5, 195);
        }}}} else {
         }
         //November08
    fill(group2);
    rect(x, (height/13)*4+15, 120, 50);
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 215) {
        if (mouseY < 265) {
            fill(255);
            text("$4,704", x+5, 245);
        }}}} else {
         }
         //January09
    fill(group2);
    rect(x, (height/13)*6+15, 120, 50);
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 315) {
        if (mouseY < 365) {
            fill(255);
            text("$2,893", x+5, 345);
        }}}} else {
         }
         //February09
    fill(group2);
    rect(x, (height/13)*7+15, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 365) {
        if (mouseY < 415) {
            fill(255);
            text("$4,680", x+5, 395);
        }}}} else {
         }
         //March09
    fill(group5);
    rect(x, (height/13)*8+15, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 415) {
        if (mouseY < 465) {
            fill(255);
            text("$12,654", x+5, 445);
        }}}} else {
         }
         //April09
    fill(group3);
    rect(x, (height/13)*9+15, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 465) {
        if (mouseY < 515) {
            fill(255);
            text("$7,038", x+5, 495);
        }}}} else {
         }
         //May09
    fill(group1);
    rect(x, (height/13)*10+15, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 515) {
        if (mouseY < 565) {
            fill(255);
            text("$2,100", x+5, 545);
        }}}} else {
         }
        // June09
    fill(group3);
    rect(x, (height/13)*11+15, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 565) {
        if (mouseY < 615) {
            fill(255);
            text("$5,414", x+5, 595);
        }}}} else {
         }
  }
      //July 08
        if (mouseX > 120){
        if (mouseX <240) {
        if (mouseY >15) {
        if (mouseY < 65) {
            fill(255);
            text("$0", x+5, 45);
        }}}} else {
         }
         //August08
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 65) {
        if (mouseY < 115) {
            fill(255);
            text("$1,066", x+5, 95);
        }}}} else {
         }
         //September08
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 115) {
        if (mouseY < 165) {
            fill(255);
            text("$0", x+5, 145);
        }}}} else {
         }
        //December08
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 265) {
        if (mouseY < 315) {
            fill(255);
            text("$149", x+5, 295);
        }}}} else {
         }
//2009-2010
  for(int i = 0; i < 12; i++) {
    y = i*(height/13)+15;
    x=((width/5)*2)+9;
    fill(group1);
    rect(x, y, 120, 50);
         //October09
    fill(group2);
    rect(x, (height/13)*3+15, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 165) {
        if (mouseY < 215) {
            fill(255);
            text("$3,201", x+5, 195);
        }}}} else {
         }
         //November09
    fill(group4);
    rect(x, (height/13)*4+15, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 215) {
        if (mouseY < 265) {
            fill(255);
            text("$9,308", x+5, 245);
        }}}} else {
         }
         //December09
    fill(group2);
    rect(x, (height/13)*5+15, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 265) {
        if (mouseY < 315) {
            fill(255);
            text("$4,153", x+5, 295);
        }}}} else {
         }
         //March10
    fill(group4);
    rect(x, (height/13)*8+15, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 415) {
        if (mouseY < 465) {
            fill(255);
            text("$8,961", x+5, 445);
        }}}} else {
         }
         //April10
    fill(group3);
    rect(x, (height/13)*9+15, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 465) {
        if (mouseY < 515) {
            fill(255);
            text("$8,297", x+5, 495);
        }}}} else {
         }
         //May10
    fill(group2);
    rect(x, (height/13)*10+15, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 515) {
        if (mouseY < 565) {
            fill(255);
            text("$2,800", x+5, 545);
        }}}} else {
         }
        // June10
    fill(group2);
    rect(x, (height/13)*11+15, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 565) {
        if (mouseY < 615) {
            fill(255);
            text("$5,150", x+5, 595);
        }}}} else {
         }
  }
      //July09
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 15) {
        if (mouseY < 65) {
            fill(255);
            text("$2,000", x+5, 45);
        }}}} else {
         }
         //August09
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 65) {
        if (mouseY < 115) {
            fill(255);
            text("$1,400", x+5, 95);
        }}}} else {
         }
         //September09
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 115) {
        if (mouseY < 165) {
            fill(255);
            text("$0", x+5, 145);
        }}}} else {
         }
                  //January10
//    fill(group1);
 //   rect(x, (height/13)*6, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 315) {
        if (mouseY < 365) {
            fill(255);
            text("$1,271", x+5, 345);
        }}}} else {
         }
         //February10
//    fill(group1);
//    rect(x, (height/13)*7, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 365) {
        if (mouseY < 415) {
            fill(255);
            text("$2,630", x+5, 395);
        }}}} else {
         }
//2010-2011
  for(int i = 0; i < 12; i++) {
    y = i*(height/13)+15;
    x=((width/5)*3)+6;
    fill(group1);
    rect(x, y, 120, 50);
    //July10
        fill(group2);
        rect(x, (height/13)*0+15, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 15) {
        if (mouseY < 65) {
            fill(255);
            text("$5,100", x+5, 45);
        }}}} else {
         }
         //October10
        fill(group3);
        rect(x, (height/13)*3+15, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 165) {
        if (mouseY < 215) {
            fill(255);
            text("$8,277", x+5, 195);
        }}}} else {
         }
         //November10
        fill(group4);
        rect(x, (height/13)*4+15, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 215) {
        if (mouseY < 265) {
            fill(255);
            text("$12,489", x+5, 245);
        }}}} else {
         }
         //January11
    fill(group2);
    rect(x, (height/13)*6+15, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 315) {
        if (mouseY < 365) {
            fill(255);
            text("$5,260", x+5, 345);
        }}}} else {
         }
         //February11
    fill(group3);
    rect(x, (height/13)*7+15, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 365) {
        if (mouseY < 415) {
            fill(255);
            text("$7,953", x+5, 395);
        }}}} else {
         }
         //March11
    fill(group3);
    rect(x, (height/13)*8+15, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 415) {
        if (mouseY < 465) {
            fill(255);
            text("$9,447", x+5, 445);
        }}}} else {
         }
         //April11
    fill(group3);
    rect(x, (height/13)*9+15, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 465) {
        if (mouseY < 515) {
            fill(255);
            text("$7,475", x+5, 495);
        }}}} else {
         }
  }
           //August10
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 65) {
        if (mouseY < 115) {
            fill(255);
            text("$1,124", x+5, 95);
        }}}} else {
         }
         //September10
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 115) {
        if (mouseY < 165) {
            fill(255);
            text("$2,580", x+5, 145);
        }}}} else {
         }
                  //December10
//    fill(group4);
  //  rect(x, (height/13)*5, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 265) {
        if (mouseY < 315) {
            fill(255);
            text("$700", x+5, 295);
        }}}} else {
         }
                  //May11
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 515) {
        if (mouseY < 565) {
            fill(255);
            text("$2,300", x+5, 545);
        }}}} else {
         }
        // June11
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 565) {
        if (mouseY < 615) {
            fill(255);
            text("$290", x+5, 595);
        }}}} else {
         }
//2011, 2012
  for(int i = 0; i < 12; i++) {
    y = i*(height/13)+15;
    x=((width/5)*4)+3;
    fill(group1);
    rect(x, y, 120, 50);
         //October11
        fill(group3);
        rect(x, (height/13)*3+15, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 165) {
        if (mouseY < 215) {
            fill(255);
            text("$8,341", x+5, 195);
        }}} else {
         }
         //November
        fill(group4);
        rect(x, (height/13)*4+15, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 215) {
        if (mouseY < 265) {
            fill(255);
            text("$10,313", x+5, 245);
        }}} else {
         }
         //March12
        fill(group5);
        rect(x, (height/13)*8+15, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 415) {
        if (mouseY < 465) {
            fill(255);
            text("$12,791", x+5, 445);
        }}} else {
         }
         //April12
    fill(group3);
    rect(x, (height/13)*9+15, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 465) {
        if (mouseY < 515) {
            fill(255);
            text("$7,961", x+5, 495);
        }}} else {
         }
         //May12
        fill(group2);
        rect(x, (height/13)*10+15, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 515) {
        if (mouseY < 565) {
            fill(255);
            text("$3,675", x+5, 545);
        }}} else {
         }

  }      
  //June12   
          if (mouseX > 480) {
        if (mouseY > 565) {
        if (mouseY < 615) {
            fill(255);
            text("$2,787", x+5, 595);
        }}} else {
         }
             //July11
             if (mouseX > 480) {
             if (mouseY >15) {
        if (mouseY < 65) {
            fill(255);
            text("$0", x+5, 45);
        }}} else {
         }
         //August11
        if (mouseX > 480) {
        if (mouseY > 65) {
        if (mouseY < 115) {
            fill(255);
            text("$0", x+5, 95);
        }}} else {
         }
         //September11
        if (mouseX > 480) {
        if (mouseY > 115) {
        if (mouseY < 165) {
            fill(255);
            text("$1,173", x+5, 145);
        }}} else {
         }
                  //December11
        if (mouseX > 480) {
        if (mouseY > 265) {
        if (mouseY < 315) {
            fill(255);
            text("$1,800", x+5, 295);
        }}} else {
         }
         //January12
        if (mouseX > 480) {
        if (mouseY > 315) {
        if (mouseY < 365) {
            fill(255);
            text("$2,800", x+5, 345);
        }}} else {
         }
         //February12
        if (mouseX > 480) {
        if (mouseY > 365) {
        if (mouseY < 415) {
            fill(255);
            text("$1,750", x+5, 395);
        }}} else {
         }
}
