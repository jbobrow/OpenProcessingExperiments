
float y;
int x;
color group1 = color(#41F24D); //0%-9%
color group2 = color(#1DBF28); //10%-19%
color group3 = color(#00960A); //20%-29%
color group4 = color(#006106); //30%-39%
color group5 = color(#003804); //40%-49%

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
  text("0-9", 73, 640);
  fill(group2);
  rect(160, 627, 15, 15);
  fill(150);
  text("10-19", 182, 640);
  fill(group3);
  rect(280, 627, 15, 15);
  fill(150);
  text("20-29", 302, 640);
  fill(group4);
  rect(400, 627, 15, 15);
  fill(150);
  text("30-39", 422, 640);
  fill(group5);
  rect(520, 627, 15, 15);
  fill(150);
  text("40-49", 542, 640);
      fill(150);
    text("J", 2, 45);
    text("A", 2, 95);
    text("S", 2, 145);
    text("O", 2, 195);
    text("N", 2, 245);
    text("D", 2, 295);
    text("J", 2, 345);
    text("F", 2, 395);
    text("M", 2, 445);
    text("A", 2, 495);
    text("M", 2, 545);
    text("J", 2, 595);
  text("2007-2008", 45, 615);
  text("2008-2009", 165, 615);
  text("2009-2010", 285, 615);
  text("2010-2011", 405, 615);
  text("2011-2012", 522, 615);
  
}

void draw() {
//2007-2008
  for(int i = 0; i < 12; i++) {
    y = i*(height/13);
    x=15;
    fill(group1);
    rect(x, y, 120, 50);
    //J
        if (mouseX < 120){
        if (mouseY < 50) {
            fill(255);
            text("$0", x+5, 30);
        }} else {
         }
         //August
        if (mouseX < 120){
        if (mouseY > 50) {
        if (mouseY < 100) {
            fill(255);
            text("$0", x+5, 80);
        }}} else {
         }
         //September
        if (mouseX < 120){
        if (mouseY > 100) {
        if (mouseY < 150) {
            fill(255);
            text("$0", x+5, 130);
        }}} else {
         }
         //October
    fill(group4);
    rect(x, (height/13)*3, 120, 50);
        if (mouseX < 120){
        if (mouseY > 150) {
        if (mouseY < 200) {
            fill(255);
            text("$15,404", x+5, 180);
        }}} else {
         }
         //November
    fill(group3);
    rect(x, (height/13)*4, 120, 50);
        if (mouseX < 120){
        if (mouseY > 200) {
        if (mouseY < 250) {
            fill(255);
            text("$14,233", x+5, 230);
        }}} else {
         }
         //December
    fill(group2);
    rect(x, (height/13)*5, 120, 50);
        if (mouseX < 120){
        if (mouseY > 250) {
        if (mouseY < 300) {
            fill(255);
            text("$6,384", x+5, 280);
        }}} else {
         }
         //January
        if (mouseX < 120){
        if (mouseY > 300) {
        if (mouseY < 350) {
            fill(255);
            text("$3,816", x+5, 330);
        }}} else {
         }
        // February
        if (mouseX < 120){
        if (mouseY > 350) {
        if (mouseY < 400) {
            fill(255);
            text("$0", x+5, 380);
        }}} else {
         }
         //March
    fill(group3);
    rect(x, (height/13)*8, 120, 50);
        if (mouseX < 120){
        if (mouseY > 400) {
        if (mouseY < 450) {
            fill(255);
            text("$12,822", x+5, 430);
        }}} else {
         }
    //April
    fill(group2);
    rect(x, (height/13)*9, 120, 50);
        if (mouseX < 120){
        if (mouseY > 450) {
        if (mouseY < 500) {
            fill(255);
            text("$6,232", x+5, 480);
        }}} else {
         }
         //May
        if (mouseX < 120){
        if (mouseY > 500) {
        if (mouseY < 550) {
            fill(255);
            text("$0", x+5, 530);
        }}} else {
         }
    //June
    fill(group2);
    rect(x, (height/13)*11, 120, 50);
        if (mouseX < 120){
        if (mouseY > 550) {
        if (mouseY < 600) {
            fill(255);
            text("$5,107", x+5, 580);
        }}} else {
         }
  } 
  //2008-2009      
  for(int i = 0; i < 12; i++) {
    y = i*(height/13);
    x=((width/5)*1)+12;
    fill(group1);
    rect(x, y, 120, 50);
    //July
        if (mouseX > 120){
        if (mouseX <240) {
        if (mouseY < 50) {
            fill(255);
            text("$0", x+5, 30);
        }}} else {
         }
         //August
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 50) {
        if (mouseY < 100) {
            fill(255);
            text("$0", x+5, 80);
        }}}} else {
         }
         //September
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 100) {
        if (mouseY < 150) {
            fill(255);
            text("$0", x+5, 130);
        }}}} else {
         }
         //October
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 150) {
        if (mouseY < 200) {
            fill(255);
            text("$3,617", x+5, 180);
        }}}} else {
         }
         //November
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 200) {
        if (mouseY < 250) {
            fill(255);
            text("$0", x+5, 230);
        }}}} else {
         }
         //December
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 250) {
        if (mouseY < 300) {
            fill(255);
            text("$0", x+5, 280);
        }}}} else {
         }
         //January
         if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 300) {
        if (mouseY < 350) {
            fill(255);
            text("$0", x+5, 330);
        }}}} else {
         }
         //February
    fill(group2);
    rect(x, (height/13)*7, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 350) {
        if (mouseY < 400) {
            fill(255);
            text("$6,010", x+5, 380);
        }}}} else {
         }
         //March
    fill(group5);
    rect(x, (height/13)*8, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 400) {
        if (mouseY < 450) {
            fill(255);
            text("$22,443", x+5, 430);
        }}}} else {
         }
         //April
    fill(group4);
    rect(x, (height/13)*9, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 450) {
        if (mouseY < 500) {
            fill(255);
            text("$18,075", x+5, 480);
        }}}} else {
         }
         //May
    fill(group2);
    rect(x, (height/13)*10, 120, 50);
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 500) {
        if (mouseY < 550) {
            fill(255);
            text("$4,856", x+5, 530);
        }}}} else {
         }
        // June
        if (mouseX > 120){
        if (mouseX < 240) {
        if (mouseY > 550) {
        if (mouseY < 600) {
            fill(255);
            text("$0", x+5, 580);
        }}}} else {
         }
  }
//2009-2010
  for(int i = 0; i < 12; i++) {
    y = i*(height/13);
    x=((width/5)*2)+9;
    fill(group1);
    rect(x, y, 120, 50);
    //July
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY < 50) {
            fill(255);
            text("$386", x+5, 30);
        }}} else {
         }
         //August
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 50) {
        if (mouseY < 100) {
            fill(255);
            text("$0", x+5, 80);
        }}}} else {
         }
         //September
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 100) {
        if (mouseY < 150) {
            fill(255);
            text("$2000", x+5, 130);
        }}}} else {
         }
         //October
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 150) {
        if (mouseY < 200) {
            fill(255);
            text("$0", x+5, 180);
        }}}} else {
         }
         //November
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 200) {
        if (mouseY < 250) {
            fill(255);
            text("$0", x+5, 230);
        }}}} else {
         }
         //December
    fill(group4);
    rect(x, (height/13)*5, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 250) {
        if (mouseY < 300) {
            fill(255);
            text("$14,921", x+5, 280);
        }}}} else {
         }
         //January
    fill(group2);
    rect(x, (height/13)*6, 120, 50);
         if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 300) {
        if (mouseY < 350) {
            fill(255);
            text("$7,509", x+5, 330);
        }}}} else {
         }
         //February
//    fill(group1);
//    rect(x, (height/13)*7, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 350) {
        if (mouseY < 400) {
            fill(255);
            text("$0", x+5, 380);
        }}}} else {
         }
         //March
//    fill(group1);
//    rect(x, (height/13)*8, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 400) {
        if (mouseY < 450) {
            fill(255);
            text("$0", x+5, 430);
        }}}} else {
         }
         //April
    fill(group4);
    rect(x, (height/13)*9, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 450) {
        if (mouseY < 500) {
            fill(255);
            text("$15,115", x+5, 480);
        }}}} else {
         }
         //May
    fill(group2);
    rect(x, (height/13)*10, 120, 50);
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 500) {
        if (mouseY < 550) {
            fill(255);
            text("$6,345", x+5, 530);
        }}}} else {
         }
        // June
        if (mouseX > 240){
        if (mouseX < 360) {
        if (mouseY > 550) {
        if (mouseY < 600) {
            fill(255);
            text("$1,032", x+5, 580);
        }}}} else {
         }
  }
//2010-2011
  for(int i = 0; i < 12; i++) {
    y = i*(height/13);
    x=((width/5)*3)+6;
    fill(group1);
    rect(x, y, 120, 50);
    //July
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY < 50) {
            fill(255);
            text("$0", x+5, 30);
        }}} else {
         }
         //August
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 50) {
        if (mouseY < 100) {
            fill(255);
            text("$0", x+5, 80);
        }}}} else {
         }
         //September
        fill(group3);
        rect(x, (height/13)*2, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 100) {
        if (mouseY < 150) {
            fill(255);
            text("$12,865", x+5, 130);
        }}}} else {
         }
         //October
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 150) {
        if (mouseY < 200) {
            fill(255);
            text("$0", x+5, 180);
        }}}} else {
         }
         //November
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 200) {
        if (mouseY < 250) {
            fill(255);
            text("$0", x+5, 230);
        }}}} else {
         }
         //December
    fill(group4);
    rect(x, (height/13)*5, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 250) {
        if (mouseY < 300) {
            fill(255);
            text("$17,902", x+5, 280);
        }}}} else {
         }
         //January
    fill(group2);
    rect(x, (height/13)*6, 120, 50);
         if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 300) {
        if (mouseY < 350) {
            fill(255);
            text("$8,598", x+5, 330);
        }}}} else {
         }
         //February
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 350) {
        if (mouseY < 400) {
            fill(255);
            text("$0", x+5, 380);
        }}}} else {
         }
         //March
    fill(group3);
    rect(x, (height/13)*8, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 400) {
        if (mouseY < 450) {
            fill(255);
            text("$11,627", x+5, 430);
        }}}} else {
         }
         //April
    fill(group3);
    rect(x, (height/13)*9, 120, 50);
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 450) {
        if (mouseY < 500) {
            fill(255);
            text("$11,779", x+5, 480);
        }}}} else {
         }
         //May
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 500) {
        if (mouseY < 550) {
            fill(255);
            text("$4,659", x+5, 530);
        }}}} else {
         }
        // June
        if (mouseX > 360){
        if (mouseX < 480) {
        if (mouseY > 550) {
        if (mouseY < 600) {
            fill(255);
            text("$0", x+5, 580);
        }}}} else {
         }
  }
//2011, 2012
  for(int i = 0; i < 12; i++) {
    y = i*(height/13);
    x=((width/5)*4)+3;
    fill(group1);
    rect(x, y, 120, 50);
    //July
        if (mouseX > 480) {
        if (mouseY < 50) {
            fill(255);
            text("$0", x+5, 30);
        }} else {
         }
         //August
        if (mouseX > 480) {
        if (mouseY > 50) {
        if (mouseY < 100) {
            fill(255);
            text("$0", x+5, 80);
        }}} else {
         }
         //September
        if (mouseX > 480) {
        if (mouseY > 100) {
        if (mouseY < 150) {
            fill(255);
            text("$0", x+5, 130);
        }}} else {
         }
         //October
        fill(group3);
        rect(x, (height/13)*3, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 150) {
        if (mouseY < 200) {
            fill(255);
            text("$6,632", x+5, 180);
        }}} else {
         }
         //November
        if (mouseX > 480) {
        if (mouseY > 200) {
        if (mouseY < 250) {
            fill(255);
            text("$0", x+5, 230);
        }}} else {
         }
         //December
        if (mouseX > 480) {
        if (mouseY > 250) {
        if (mouseY < 300) {
            fill(255);
            text("$0", x+5, 280);
        }}} else {
         }
         //January
    fill(group3);
    rect(x, (height/13)*6, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 300) {
        if (mouseY < 350) {
            fill(255);
            text("$13,022", x+5, 330);
        }}} else {
         }
         //February
        fill(group2);
        rect(x, (height/13)*7, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 350) {
        if (mouseY < 400) {
            fill(255);
            text("$7,328", x+5, 380);
        }}} else {
         }
         //March
        if (mouseX > 480) {
        if (mouseY > 400) {
        if (mouseY < 450) {
            fill(255);
            text("$500", x+5, 430);
        }}} else {
         }
         //April
    fill(group4);
    rect(x, (height/13)*9, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 450) {
        if (mouseY < 500) {
            fill(255);
            text("$18,091", x+5, 480);
        }}} else {
         }
         //May
        fill(group2);
        rect(x, (height/13)*10, 120, 50);
        if (mouseX > 480) {
        if (mouseY > 500) {
        if (mouseY < 550) {
            fill(255);
            text("$9,523", x+5, 530);
        }}} else {
         }
        // June
        if (mouseX > 480) {
        if (mouseY > 550) {
        if (mouseY < 600) {
            fill(255);
            text("$0", x+5, 580);
        }}} else {
         }
  }
}
