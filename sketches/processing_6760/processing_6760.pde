


PFont font_09;
PFont font_12;
PFont font_18;
int capacity_106 = 85;
int capacity_107 = 40;
int capacity_108 = 75;
int capacity_111 = 16;
int capacity_113 = 42;
int capacity_115 = 40;
int capacity_116 = 16;
int capacity_117 = 26;
int capacity_118 = 24;
int capacity_119 = 36;
int capacity_121 = 49;
int capacity_130 = 36;
int capacity_132 = 24;
int capacity_134 = 32;
int floor_1 = 51;
int floor_2 = 51;
int floor_3 = 51;
int floor_4 = 51;
int capacity_floor_1 = 0;
int chart_x = 390;
int chart_y = 470;
int enrollment_econ_10301 = 84;
int enrollment_cmst_13243 = 28;
int enrollment_civl_21101 = 72;
int enrollment_cmst_33401 = 35;
int enrollment_recr_42001 = 34;
int enrollment_swrk_60802 = 15;
int enrollment_recr_35001 = 47;
int enrollment_cmsd_62001 = 22;
int time_900am = 0;
int capacity_width = 20;
int course_info = 0;
int floor_on_1 = 0;
int floor_off_1 = 255;
int legend_on = 0;


void setup() {
   size(800, 600);
   smooth();
   frameRate(10);
   font_09 = loadFont("Corbel-Bold-9.vlw");
   font_12 = loadFont("Corbel-12.vlw");
   font_18 = loadFont("Corbel-Bold-18.vlw");
}



void draw() {

  background(0);
  fill(164, 0, 70);
  rect(0, 0, 800, 80);

  textFont(font_18);
  fill(255);
  text("Tehama Hall Space Utilization", 390, 40);
  textFont(font_12);
  fill(0);
  text("Fall 2009", 120, 40);


  fill(floor_1);
  noStroke();
  rect(390, 68, 20, 20);
  fill(255);
  textFont(font_12);
  text("1", 397, 80);

  fill(floor_2);
  rect(430, 68, 20, 20);
  fill(255);
  text("2", 437, 80);

  fill(floor_3);
  rect(470, 68, 20, 20);
  fill(255);
  text("3", 477, 80);
  
  strokeWeight(1);
  stroke(102);
  line(100, 170, 800, 170);
  stroke(51);
  line(100, 180, 800, 180);
  line(100, 190, 800, 190);
  line(100, 200, 800, 200);
  line(100, 210, 800, 210);
  stroke(102);
  line(100, 220, 800, 220);
  stroke(51);
  line(100, 230, 800, 230);
  line(100, 240, 800, 240);
  line(100, 250, 800, 250);
  line(100, 260, 800, 260);
  stroke(255);
  line(100, 270, 800, 270);
  stroke(51);
  line(100, 280, 800, 280);
  line(100, 290, 800, 290);
  line(100, 300, 800, 300);
  line(100, 310, 800, 310);
  stroke(102);
  line(100, 320, 800, 320);
  stroke(51);
  line(100, 330, 800, 330);
  line(100, 340, 800, 340);
  line(100, 350, 800, 350);
  line(100, 360, 800, 360);
  stroke(102);
  line(100, 370, 800, 370);

  noStroke();
  textFont(font_09);
  fill(102);
  text("100", 80, 172);
  text("50", 85, 222);
  text("0", 89, 272);
  text("50", 85, 322);
  text("100", 80, 372);


  textFont(font_12);
  fill(153, legend_on);
  text("Room Capacity", 120, chart_y + 11);
  fill(70, 90, 160, legend_on);
  text("Enrolled in Course", 120, chart_y + 26);
  fill(255, 200, 70, legend_on);
  text("Under-Utilized Seats", 120, chart_y + 41);
  fill(164, 0, 70, legend_on);
  text("Over-Enrolled Course", 120, chart_y + 56);



  strokeWeight(1);
  stroke(102);
  line(chart_x, chart_y, chart_x, chart_y + 90);
  stroke(51);
  line(chart_x + 10, chart_y, chart_x + 10, chart_y + 90);
  stroke(102);
  line(chart_x + 20, chart_y, chart_x + 20, chart_y + 90);
  stroke(51);
  line(chart_x + 30, chart_y, chart_x + 30, chart_y + 90);
  stroke(102);
  line(chart_x + 40, chart_y, chart_x + 40, chart_y + 90);
  stroke(51);
  line(chart_x + 50, chart_y, chart_x + 50, chart_y + 90);
  stroke(102);
  line(chart_x + 60, chart_y, chart_x + 60, chart_y + 90);
  stroke(51);
  line(chart_x + 70, chart_y, chart_x + 70, chart_y + 90);
  stroke(102);
  line(chart_x + 80, chart_y, chart_x + 80, chart_y + 90);
  stroke(51);
  line(chart_x + 90, chart_y, chart_x + 90, chart_y + 90);
  stroke(102);
  line(chart_x + 100, chart_y, chart_x + 100, chart_y + 90);
  stroke(51);
  line(chart_x + 110, chart_y, chart_x + 110, chart_y + 90);
  stroke(102);
  line(chart_x + 120, chart_y, chart_x + 120, chart_y + 90);
  stroke(51);
  line(chart_x + 130, chart_y, chart_x + 130, chart_y + 90);
  stroke(102);
  line(chart_x + 140, chart_y, chart_x + 140, chart_y + 90);
  stroke(51);
  line(chart_x + 150, chart_y, chart_x + 150, chart_y + 90);
  stroke(102);
  line(chart_x + 160, chart_y, chart_x + 160, chart_y + 90);
  stroke(51);
  line(chart_x + 170, chart_y, chart_x + 170, chart_y + 90);
  stroke(102);
  line(chart_x + 180, chart_y, chart_x + 180, chart_y + 90);
  stroke(51);
  line(chart_x + 190, chart_y, chart_x + 190, chart_y + 90);
  stroke(102);
  line(chart_x + 200, chart_y, chart_x + 200, chart_y + 90);
  stroke(51);
  line(chart_x + 210, chart_y, chart_x + 210, chart_y + 90);
  stroke(102);
  line(chart_x + 220, chart_y, chart_x + 220, chart_y + 90);
  stroke(51);
  line(chart_x + 230, chart_y, chart_x + 230, chart_y + 90);
  stroke(102);
  line(chart_x + 240, chart_y, chart_x + 240, chart_y + 90);
  stroke(51);
  line(chart_x + 250, chart_y, chart_x + 250, chart_y + 90);
  stroke(102);
  line(chart_x + 260, chart_y, chart_x + 260, chart_y + 90);
  stroke(51);
  line(chart_x + 270, chart_y, chart_x + 270, chart_y + 90);
  stroke(102);
  line(chart_x + 280, chart_y, chart_x + 280, chart_y + 90);

  line(chart_x, chart_y, chart_x + 280, chart_y);
  line(chart_x, chart_y + 15, chart_x + 280, chart_y + 15);
  line(chart_x, chart_y + 30, chart_x + 280, chart_y + 30);
  line(chart_x, chart_y + 45, chart_x + 280, chart_y + 45);
  line(chart_x, chart_y + 60, chart_x + 280, chart_y + 60);
  line(chart_x, chart_y + 75, chart_x + 280, chart_y + 75);
  line(chart_x, chart_y + 90, chart_x + 280, chart_y + 90);

  fill(102);
  textFont(font_09);
  text("M", chart_x - 14, chart_y + 11);
  text("T", chart_x - 13, chart_y + 26);
  text("W", chart_x - 15, chart_y + 41);
  text("R", chart_x - 14, chart_y + 56);
  text("F", chart_x - 14, chart_y + 71);
  text("S", chart_x - 14, chart_y + 86);

  text("8", chart_x, chart_y + 102);
  text("9", chart_x + 20, chart_y + 102);
  text("10", chart_x + 40, chart_y + 102);
  text("11", chart_x + 60, chart_y + 102);
  text("12", chart_x + 80, chart_y + 102);
  text("1", chart_x + 100, chart_y + 102);
  text("2", chart_x + 120, chart_y + 102);
  text("3", chart_x + 140, chart_y + 102);
  text("4", chart_x + 160, chart_y + 102);
  text("5", chart_x + 180, chart_y + 102);
  text("6", chart_x + 200, chart_y + 102);
  text("7", chart_x + 220, chart_y + 102);
  text("8", chart_x + 240, chart_y + 102);
  text("9", chart_x + 260, chart_y + 102);


  fill(153, capacity_floor_1);
  noStroke();
  rect(120, 270 - capacity_106, capacity_width, capacity_106);
  rect(150, 270 - capacity_107, capacity_width, capacity_107);
  rect(180, 270 - capacity_108, capacity_width, capacity_108);
  rect(210, 270 - capacity_111, capacity_width, capacity_111);
  rect(240, 270 - capacity_113, capacity_width, capacity_113);
  rect(270, 270 - capacity_115, capacity_width, capacity_115);
  rect(300, 270 - capacity_116, capacity_width, capacity_116);
  rect(330, 270 - capacity_117, capacity_width, capacity_117);
  rect(360, 270 - capacity_118, capacity_width, capacity_118);
  rect(390, 270 - capacity_119, capacity_width, capacity_119);
  rect(420, 270 - capacity_121, capacity_width, capacity_121);
  rect(450, 270 - capacity_130, capacity_width, capacity_130);
  rect(480, 270 - capacity_132, capacity_width, capacity_132);
  rect(510, 270 - capacity_134, capacity_width, capacity_134);


  if (key == '1') {
    capacity_floor_1 = 255;
    floor_1 = 102;
    floor_on_1 = 255;
}   else {
    capacity_floor_1 = 0;
    floor_1 = 51;
  }
 
  fill(floor_on_1, floor_off_1);
  textFont(font_12);
  text("First Floor Maximum Occupancy", 390, 110);


    noStroke();
    fill(70, 90, 160, time_900am);
    rect(chart_x + 20, chart_y, 10, 16);
    
    fill(70, 90, 160, time_900am);    
    rect(125, 270 - enrollment_econ_10301, 15, enrollment_econ_10301);
    fill(255, 200, 70,time_900am);
    rect(125, 271, 15, capacity_106 - enrollment_econ_10301);

    fill(70, 90, 160, time_900am);
    rect(155, 270 - enrollment_cmst_13243, 15, enrollment_cmst_13243);
    fill(255, 200, 70,time_900am);
    rect(155, 271, 15, capacity_107 - enrollment_cmst_13243);

    fill(70, 90, 160, time_900am);
    rect(185, 270 - enrollment_civl_21101, 15, enrollment_civl_21101);
    fill(255, 200, 70,time_900am);
    rect(185, 271, 15, capacity_108 - enrollment_civl_21101);

    fill(70, 90, 160, time_900am);
    rect(215, 270 - 0, 15, 0);
    fill(255, 200, 70,time_900am);
    rect(215, 271, 15, capacity_111 - 0);

    fill(70, 90, 160, time_900am);
    rect(245, 270 - 0, 15, 0);
    fill(255, 200, 70,time_900am);
    rect(245, 271, 15, capacity_113 - 0);

    fill(70, 90, 160, time_900am);
    rect(275, 270 - enrollment_cmst_33401, 15, enrollment_cmst_33401);
    fill(255, 200, 70,time_900am);
    rect(275, 271, 15, capacity_115 - enrollment_cmst_33401);

      fill(164, 0, 70, time_900am);
      rect(305, 270 - enrollment_recr_42001, 15, enrollment_recr_42001);
    
    fill(70, 90, 160, time_900am);
    rect(335, 270 - enrollment_swrk_60802, 15, enrollment_swrk_60802);
    fill(255, 200, 70,time_900am);
    rect(335, 271, 15, capacity_117 - enrollment_swrk_60802);

    fill(70, 90, 160, time_900am);
    rect(365, 270 - 0, 15, 0);
    fill(255, 200, 70,time_900am);
    rect(365, 271, 15, capacity_118 - 0);

    fill(70, 90, 160, time_900am);
    rect(395, 270 - 0, 15, 0);
    fill(255, 200, 70,time_900am);
    rect(395, 271, 15, capacity_119 - 0);

    fill(70, 90, 160, time_900am);
    rect(425, 270 - enrollment_recr_35001, 15, enrollment_recr_35001);
    fill(255, 200, 70,time_900am);
    rect(425, 271, 15, capacity_121 - enrollment_recr_35001);

    fill(70, 90, 160, time_900am);
    rect(455, 270 - enrollment_cmsd_62001, 15, enrollment_cmsd_62001);
    fill(255, 200, 70,time_900am);
    rect(455, 271, 15, capacity_130 - enrollment_cmsd_62001);

      fill(164, 0, 70, time_900am);
      rect(485, 270 - enrollment_recr_42001, 14, enrollment_recr_42001);

    fill(70, 90, 160, time_900am);
    rect(515, 270 - 0, 15, 0);
    fill(255, 200, 70,time_900am);
    rect(515, 271, 15, capacity_134 - 0);



  if((mouseX > 120) && (mouseX < 140) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("ECON 103-01", 120, 140);
  text("84", 120, 155);
  text("THMA-106", 120, 390);
  text("APO", 120, 405);
  text("85", 120, 420);

  if((mouseX > 150) && (mouseX < 170) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("CMST 132-43", 150, 140);
  text("28", 150, 155);
  text("THMA-107", 150, 390);
  text("CDES", 150, 405);
  text("40", 150, 420);

  if((mouseX > 180) && (mouseX < 200) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("CIVL-211-01", 180, 140);
  text("72", 180, 155);
  text("THMA-108", 180, 390);
  text("APO", 180, 405);
  text("75", 180, 420);

  if((mouseX > 210) && (mouseX < 230) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text(" ", 210, 140);
  text("0", 210, 155);
  text("THMA-111", 210, 390);
  text("RECR", 210, 405);
  text("16", 210, 420);

  if((mouseX > 240) && (mouseX < 260) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text(" ", 240, 140);
  text("0", 240, 155);
  text("THMA-113", 240, 390);
  text("CMAS", 240, 405);
  text("42", 240, 420);

  if((mouseX > 270) && (mouseX < 290) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("CMST 334-01", 270, 140);
  text("35", 270, 155);
  text("THMA-115", 270, 390);
  text("CMAS", 270, 405);
  text("40", 270, 420);

  if((mouseX > 300) && (mouseX < 320) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("RECR 420-01", 300, 140);
  text("34", 300, 155);
  text("THMA-116", 300, 390);
  text("PSED", 300, 405);
  text("16", 300, 420);


  if((mouseX > 330) && (mouseX < 350) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("SWRK 608-02", 330, 140);
  text("15", 330, 155);
  text("THMA-117", 330, 390);
  text("AMIS", 330, 405);
  text("26", 330, 420);

  if((mouseX > 360) && (mouseX < 380) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text(" ", 360, 140);
  text("0", 360, 155);
  text("THMA-118", 360, 390);
  text("NFSC", 360, 405);
  text("24", 360, 420);

  if((mouseX > 390) && (mouseX < 410) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text(" ", 390, 140);
  text("0", 390, 155);
  text("THMA-119", 390, 390);
  text("CMAS", 390, 405);
  text("36", 390, 420);

  if((mouseX > 420) && (mouseX < 440) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("RECR 350-01", 420, 140);
  text("47", 420, 155);
  text("THMA-121", 420, 390);
  text("RECR", 420, 405);
  text("49", 420, 420);

  if((mouseX > 450) && (mouseX < 470) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("CMSD 620-01", 450, 140);
  text("22", 450, 155);
  text("THMA-130", 450, 390);
  text("JOUR", 450, 405);
  text("36", 450, 420);

  if((mouseX > 480) && (mouseX < 500) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text("RECR 420-01", 480, 140);
  text("34", 480, 155);
  text("THMA-132", 480, 390);
  text("EDUC", 480, 405);
  text("24", 480, 420);


  if((mouseX > 510) && (mouseX < 530) && (mouseY > 170) && (mouseY < 370) && (capacity_width == 5) && (floor_1 == 102)) {
    course_info = 255;
  } else {
    course_info = 0;
    }

  fill(255, course_info);
  text(" ", 510, 140);
  text("0", 510, 155);
  text("THMA-134", 510, 390);
  text("RECR", 510, 405);
  text("32", 510, 420);


    

}


void mouseClicked() {
  if((mouseX > chart_x + 20) && (mouseX < chart_x + 30) && (mouseY > chart_y) && (mouseY < chart_y + 15) && (floor_1 == 102)) {
    time_900am = 255;
    capacity_width = 5;
    floor_off_1 = 0;
    legend_on = 255;
  } else {
    time_900am = 0;
    capacity_width = 20;
  }
}





