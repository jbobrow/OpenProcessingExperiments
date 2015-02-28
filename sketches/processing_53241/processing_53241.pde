
PFont font;
int s = 10;
float w;
float c;
float y;
float l;
float m; 
float d;
float h;

int bx = 200;
int by = 200;
int bxs = 6;
int bys = 4;

int bx1 = 200;
int by1 = 200;
int bxs1 = -3;
int bys1 = -2;

int bx2 = 200;
int by2 = 200;
int bxs2 = 2;
int bys2 = 1;


String M = "January";
String D = "Sunday";


void setup(){
    size(640,480);
    smooth();
    font = createFont("HelveticaNeue-CondensedBlack", 72);
    textFont(font, 52);
    
   
}

void draw(){
    background(50,42,45);
    
    fill(200);
    noStroke();
    rectMode(CORNER);
    rect(0,height-100,width,height);
    rect(0,0,width,100);
    
    
    
    
    textFont(font, 52);
    
    
    
    fill(100,90,90);
    if(hour() <= 12 && hour() > 0 && minute() > 9){
        text(hour()+":"+minute(),s,height-55);
    }
    if(hour() <= 12 && hour() > 0 && minute() <= 9){
        text(hour()+":"+"0"+minute(),s,height-55);
    }
    if(hour() > 12 && minute() > 9){
        text(hour()-12+":"+minute(),s,height-55);
    }
    if(hour() > 12 && minute() <= 9){
        text(hour()-12+":"+"0"+minute(),s,height-55);
    }
    
    if(hour() == 0 && minute() > 9){
        text("12"+":"+minute(),s,height-55);
    }
    if(hour() == 0 && minute() <= 9){
        text("12"+":"+"0"+minute(),s,height-55);
    } 
    
    if(day() > 9 && month() > 9){  
        text(month()+"/"+day()+"/"+year(),10,height-15);
    }
    
    if(day() < 10 && month() > 9){  
        text(month()+"/"+"0"+day()+"/"+year(),10,height-15);
    } 
    
    if(day() > 9 && month() < 10){  
        text("0"+month()+"/"+day()+"/"+year(),10,height-15);
    } 
    
    textFont(font, 30);
    
    if(second() < 10){
        text("0"+second(),135,height-55);
    }
    
    if(second() > 9){
        text(second(),135,height-55);
    }
    
    if(hour() < 12){
        text("AM",175,height-55);
    }
    else{
        text("PM",175,height-55);
    }
    
    textFont(font, 50);
    text(M+" "+year(),5,90);
    text(D+",",5,46);
    
    if(month() == 1){ M = "January";}
    if(month() == 2){ M = "February";}
    if(month() == 3){ M = "March";}
    if(month() == 4){ M = "April";}
    if(month() == 5){ M = "May";}
    if(month() == 6){ M = "June";}
    if(month() == 7){ M = "July";}
    if(month() == 8){ M = "August";}
    if(month() == 9){ M = "September";}
    if(month() == 10){ M = "October";}
    if(month() == 11){ M = "November";}
    if(month() == 12){ M = "December";}
    
    
    c = 4;
    y = year() - 2000;
    l = floor(y/4);
    if(month() == 1){ m = 3;}
    if(month() == 2){ m = 6;}
    if(month() == 3){ m = 6;}
    if(month() == 4){ m = 2;}
    if(month() == 5){ m = 4;}
    if(month() == 6){ m = 0;}
    if(month() == 7){ m = 2;}
    if(month() == 8){ m = 5;}
    if(month() == 9){ m = 1;}
    if(month() == 10){ m = 3;}
    if(month() == 11){ m = 6;}
    if(month() == 12){ m = 5;}
    
    d = day();
    h = c+y+m+l+d;
    
    if(y==4||y==8||y==12||y==16||y==20||y==24||y==28||y==32||y==36||y==40){
        w=h%7-1;
    }
    else{
        w=h%7;
    }
    
    if(w == 1){ D="Sunday";}
    if(w == 2){ D="Monday";}
    if(w == 3){ D="Tuesday";}
    if(w == 4){ D="Wednesday";}
    if(w == 5){ D="Thursday";}
    if(w == 6){ D="Friday";}
    if(w == 7){ D="Saturday";}
    
    
    fill(255,255,255,200);
    noStroke();
    ellipseMode(CENTER);
    ellipse(bx,by,20,20);
    ellipse(bx1,by1,40,40);
    ellipse(bx2,by2,60,60);
    fill(150);
    rectMode(CENTER);
    rect(bx,by,10,10);
    rect(bx1,by1,10,10);
    rect(bx2,by2,10,10);
    stroke(255,0,0);
    strokeWeight(1);
    line(bx,by,bx1,by1);
    stroke(0,255,0);
    line(bx,by,bx2,by2);
        stroke(0,0,255);
    line(bx1,by1,bx2,by2);
    
    
    
    bx+=bxs;
    by+=bys;
    
    bx1+=bxs1;
    by1+=bys1;
    
    bx2+=bxs2;
    by2+=bys2;
    
    if(bx-10<0||bx+10>width){
        bxs*=-1;
    }
    if(by-10<100||by+10>height-100){
        bys*=-1;
    }
    
    if(bx1-20<0||bx1+20>width){
        bxs1*=-1;
    }
    if(by1-20<100||by1+20>height-100){
        bys1*=-1;
    }
    
    if(bx2-30<0||bx2+30>width){
        bxs2*=-1;
    }
    if(by2-30<100||by2+30>height-100){
        bys2*=-1;
    } 
    
    
    
    
}

