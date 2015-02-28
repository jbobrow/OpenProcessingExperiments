
//fields
int clicker = 0;
float displaytotspend = 0;
float linemaintainer = 0;
//Money expressed in trillions of dollars
float pensions = 0;
float healthcare = 0;
float education = 0;
float defense = 0;
float welfare = 0;
float totalspending = 0;
//methods
void setup() {
  size(800, 800);
  background(0);
}

void mousePressed() {
  clicker++;
}

void draw() {
  if (clicker == 0) {
    textSize(24);
    text("Click to see the federal spending for the past 5 years", 10, 30);
  }
  else {
    if (clicker == 1) {
      background(0);
      mousePressed();
    }
  }
  if (clicker>1) {
    if (mouseX > 0 && mouseX <= 160) {
      amount2009();
    }
    else {
      if (mouseX > 160 && mouseX <= 320) {
        amount2010();
      }
      else {
        if (mouseX > 320 && mouseX <= 480) {
          amount2011();
        }
        else {
          if (mouseX > 480 && mouseX <= 640) {
            amount2012();
          }
          else {
            if (mouseX > 640 && mouseX <= 800) {
              amount2013();
            }
          }
        }
      }
    }
    //2009
    if (mouseX > 0 && mouseX <= 160) {
      textSize(24);
      fill(0, 200, 0);
      text("Social Security", 620, 700);
      text("Healthcare", 50, 700);
      text("Education", 10, 545);
      text("Defense", 10, 200);
      text("Welfare", 350, 40);
      text("Other", 730, 270);
      fill(200, 0, 0);
      text("2009", 50, 775);  
      fill(255);
      text("2010", 210, 775);  
      fill(255);
      text("2011", 370, 775);  
      fill(255);
      text("2012", 530, 775);  
      fill(255);
      text("2013", 690, 775);
    }
    else {
      //2010
      if (mouseX > 160 && mouseX <= 320) {
        textSize(24);
        fill(0, 200, 0);
        text("Social Security", 620, 700);
        text("Healthcare", 50, 700);
        text("Education", 10, 445);
        text("Defense", 100, 100); 
        text("Welfare", 450, 50); 
        text("Other", 730, 270);
        fill(255);
        text("2009", 50, 775);  
        fill(200, 0, 0);
        text("2010", 210, 775);  
        fill(255);
        text("2011", 370, 775);  
        fill(255);
        text("2012", 530, 775);  
        fill(255);
        text("2013", 690, 775);
      }
      else {
        //2011
        if (mouseX > 320 && mouseX <= 480) {
          textSize(24);
          fill(0, 200, 0);
          text("Social Security", 620, 700);
          text("Healthcare", 50, 700);
          text("Education", 10, 465); //11,12
          text("Defense", 100, 100); 
          text("Welfare", 450, 50); 
          text("Other", 730, 270);          
          fill(255);
          text("2009", 50, 775);  
          fill(255);
          text("2010", 210, 775);  
          fill(200, 0, 0);
          text("2011", 370, 775);  
          fill(255);
          text("2012", 530, 775);  
          fill(255);
          text("2013", 690, 775);
        }
        else {
          //2012
          if (mouseX > 480 && mouseX <= 640) {
            textSize(24);
            fill(0, 200, 0);
            text("Social Security", 620, 700);
            text("Healthcare", 50, 700);
            text("Education", 10, 475);
            text("Defense", 100, 100); 
            text("Welfare", 450, 50); 
            text("Other", 730, 270);
            fill(255);
            text("2009", 50, 775);  
            fill(255);
            text("2010", 210, 775);  
            fill(255);
            text("2011", 370, 775);  
            fill(200, 0, 0);
            text("2012", 530, 775);  
            fill(255);
            text("2013", 690, 775);
          }
          else {
            //2013
            if (mouseX > 640 && mouseX <= 800) {
              textSize(24);
              fill(0, 200, 0);
              text("Social Security", 620, 700);
              text("Healthcare", 50, 700);
              text("Education", 10, 425); 
              text("Defense", 100, 100); 
              text("Welfare", 450, 50); 
              text("Other", 730, 270);
              fill(255);
              text("2009", 50, 775);  
              fill(255);            
              text("2010", 210, 775);  
              fill(255);
              text("2011", 370, 775);  
              fill(255);
              text("2012", 530, 775); 
              fill(200, 0, 0); 
              text("2013", 690, 775);
              fill(255);
            }
          }
        }
      }
    }
  }
}

void amount2013() {
  linemaintainer = 0;
  pensions = 0.8785;
  healthcare = 0.9161;
  education = 0.1361;
  defense = 0.9014;
  welfare = 0.4223;
  totalspending = 3.8034;
  create(linemaintainer, pensions, healthcare, education, defense, welfare, totalspending);
}

void amount2012() {
  linemaintainer = 0;
  pensions = 0.8197;
  healthcare = 0.8461;
  education = 0.1531;
  defense = 0.9022;
  welfare = 0.4519;
  totalspending = 3.7956;
  create(linemaintainer, pensions, healthcare, education, defense, welfare, totalspending);
}

void amount2011() {
  linemaintainer = 0;
  pensions = 0.7756;
  healthcare = 0.8582;
  education = 0.1137;
  defense = 0.8785;
  welfare = 0.4729;
  totalspending = 3.6031;
  create(linemaintainer, pensions, healthcare, education, defense, welfare, totalspending);
}

void amount2010() {
  linemaintainer = 0;
  pensions = 0.7496;
  healthcare = 0.8207;
  education = 0.1394;
  defense = 0.8472;
  welfare = 0.5023;
  totalspending = 3.4562;
  create(linemaintainer, pensions, healthcare, education, defense, welfare, totalspending);
}

void amount2009() {
  linemaintainer = 0;
  pensions = 0.7304;
  healthcare = 0.7644;
  education = 0.0898;
  defense = 0.7940;
  welfare = 0.4151;
  totalspending = 3.5177;
  create(linemaintainer, pensions, healthcare, education, defense, welfare, totalspending);
}

void create(float linemaintainer, float pensions, float healthcare, float education, float defense, float welfare, float totalspending) {
  fill(0);
  rectMode(CENTER);
  rect(400,400,900,900);
  fill(255);
  ellipseMode(CENTER);
  ellipse(400, 400, 700, 700);
  textSize(60);
  fill(0,0,200);
  text("$" + totalspending, 275, 420);
  line(400, 400, 400*cos(2*PI) + 400, 400*sin(2*PI) + 400);
  line(400, 400, 400*cos(2*PI * (pensions/totalspending)) + 400, 400*sin(2*PI * (pensions/totalspending)) + 400);
  linemaintainer += pensions/totalspending;
  line(400, 400, 400*(cos(2*PI * ((healthcare/totalspending) + linemaintainer))) + 400, 400*(sin(2*PI * ((healthcare/totalspending) + linemaintainer))) + 400);
  linemaintainer += healthcare/totalspending;
  line(400, 400, 400*(cos(2*PI * ((education/totalspending) + linemaintainer))) + 400, 400*(sin(2*PI * ((education/totalspending) + linemaintainer))) + 400);
  linemaintainer += education/totalspending;
  line(400, 400, 400*(cos(2*PI * ((defense/totalspending) + linemaintainer))) + 400, 400*(sin(2*PI * ((defense/totalspending) + linemaintainer))) + 400);
  linemaintainer += defense/totalspending;
  line(400, 400, 400*(cos(2*PI * ((welfare/totalspending) + linemaintainer))) + 400, 400*(sin(2*PI * ((welfare/totalspending) + linemaintainer))) + 400);
  linemaintainer += welfare/totalspending;
  textSize(24);
  fill(0,200,255);
  text((int)(pensions/totalspending * 100) + "%",750,725);
  text((int)(healthcare/totalspending * 100) + "%",25,725);
  text((int)(education/totalspending * 100) + "%",25,525);
  text((int)(defense/totalspending * 100) + "%",75,135);
  text((int)(welfare/totalspending * 100) + "%",400,25);
  text((int)((totalspending - (pensions + healthcare + education + defense + welfare))/totalspending * 100) + "%",750,225);
  linemaintainer = 0;
}


