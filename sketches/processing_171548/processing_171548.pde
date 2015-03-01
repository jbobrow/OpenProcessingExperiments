
float a=0;
float b=0;
float c=0;
float d=0;
float e=0;
float f=0;
float g=0;
float h=0;
float i=0;
float j=0;
float k=0;
float l=0;
float m=0;
float n=0;
float o=0;
float p=0;
float q=0;
float r=0;
float s=0;
float t=0;
float u=0;
float v=0;
float w=0;
float x=0;
float y=0;
float z=0;
float aa=0;
float bb=0;
float cc=0;
float dd=0;
float ee=0;
float ff=0;
float gg=0;
float hh=0;
float ii=0;
float jj=0;
float kk=0;
float ll=0;
float mm=0;
float nn=0;
float oo=0;
float pp=0;
float qq=0;
float rr=0;
float ss=0;
float tt=0;
float uu=0;
float vv=0;
float ww=0;
float xx=0;
float yy=0;
float zz=0;
float aaa=0;
float bbb=0;
float ccc=0;
float ddd=0;
float eee=0;
float fff=0;
float ggg=0;
float hhh=0;
float time=0;
void setup() {
  size(1130, 700);
}

void draw() {
  background(235, 236, 237);
  noStroke();
  fill(53, 107, 180);
  rect(0, 0, 1130, 42);
  //end top bar
  fill(255);
  rect(80, 10, 20, 20);
  fill(53, 107, 180);//lighter blue color
  textSize(23);
  text("f", 90, 30);
  //end facebook symbol
  fill(255);
  rect(110, 10, 580, 20);
  fill(173, 176, 180);//grey color
  textSize(15);
  text("Search for people, places and things", 115, 25);
  //end search bar
  fill(255, 253, 211);//yellow
  rect(740, 13, 17, 17);
  //end profile pic
  textSize(13);
  text("James", 765, 25);
  text("Home", 815, 25);
  fill(31, 84, 152); //darker blue color
  textSize(18);
  text("|", 805, 27);
  //end name and home
  ellipse(885, 17, 8, 8);
  stroke(53, 107, 180);
  rect(888, 24, 12, 6);
  rect(877, 22, 16, 8);
  ellipse(894, 18, 6, 6);
  //end people icon
  noStroke();
  triangle(913, 29, 917, 29, 913, 33);
  rect(911, 17, 14, 12);
  stroke(53, 107, 180);
  rect(917, 12, 16, 13);
  //end text icon
  noStroke();
  ellipse(953, 21, 20, 20);
  text("|", 973, 27);
  //end world icon
  stroke(31, 84, 152); //darker blue color
  fill(53, 107, 180);//lighter blue color
  ellipse(993, 19, 8, 10);
  noStroke();
  fill(31, 84, 152);
  rect(988, 18, 11, 9);
  triangle(1013, 19, 1026, 19, 1019, 26);
  //end top bar
  fill(255);
  rect(250, 60, 500, 70);
  fill(0, 0, 0);
  textSize(12);
  text("Update Status", 278, 80);
  fill(31, 84, 152);
  rect(260, 68, 15, 15);
  fill(173, 176, 180);//grey
  textSize(18);
  text("|", 368, 81);
  fill(255, 172, 62);//orange
  rect(384, 68, 15, 15);
  fill(53, 107, 180);//blue
  textSize(12);
  text("Add Photos/Video", 403, 81);
  stroke(173, 176, 180);//grey
  line(260, 90, 740, 90);
  fill(173, 176, 180); //grey
  textSize(16);
  text("What's on your mind?", 260, 115);
  //end status box

  noStroke();
  fill(255);
  rect(760, 60, 280, 700);
  fill(242, 62, 12);//red
  rect(770, 90, 15, 15);
  fill(53, 107, 180);//blue
  textSize(12);
  text("1 event invite", 790, 102);
  stroke(173, 176, 180);//grey
  line(770, 115, 1030, 115);
  fill(173, 176, 180);//grey
  textSize(12);
  text("TRENDING", 770, 135);
  fill(53, 107, 180);//blue
  text("Processing", 770, 155);
  fill(173, 176, 180);
  text(": The language of the future", 832, 155);
  text("is now a mainstay of modern homes", 770, 170);
  fill(53, 107, 180);//blue
  text("iPhone 9", 770, 195);
  fill(173, 176, 180);//grey
  text(": Rumors suggest the new phone", 820, 195);
  text("will incorporate biotechnological chips", 770, 210);
  fill(53, 107, 180);//blue
  text("Game of Thrones", 770, 230);
  fill(173, 176, 180);//grey
  text(": Long-running show", 870, 230);
  text("renewed for a 10th season", 770, 245);

  //end trending and ticker


  stroke(173, 176, 180);//grey
  line(770, 260, 1030, 260);
  noStroke();
  text("SPONSORED", 770, 280);
  fill(252, 229, 240);
  rect(770, 290, 260, 150);
  fill(255, 93, 169);
  textSize(20);
  text("Looking for a Soulmate?", 783, 370);
  fill(53, 107, 180);//blue
  textSize(12);
  text("Find her", 770, 460);
  text("love.com", 770, 475);
  fill(173, 176, 180);//grey
  text("She's been looking for you and she wants", 770, 490);
  text("you to find her.", 770, 505);
  stroke(173, 176, 180);//grey
  line(770, 520, 1030, 520);
  noStroke();
  fill(252, 222, 255);
  rect(770, 540, 260, 150);
  fill(237, 77, 255);
  textSize(20);
  text("Seriously.", 850, 620);
  //end ad box


  fill(255, 253, 211);//yellow
  rect(80, 56, 35, 35);
  fill(0, 0, 0);
  ellipse(90, 68, 5, 10);
  ellipse(105, 68, 5, 10);
  noFill();
  stroke(0, 0, 0);
  arc(97, 79, 20, 20, 0, PI);
  textSize(12);
  text("James Morse", 120, 71);
  text("Edit Profile", 119, 88);
  //end profile pic

  noStroke();
  fill(53, 107, 180);
  rect(80, 108, 12, 12);
  fill(0, 0, 0);
  text("News Feed", 98, 119);
  fill(255, 206, 223);//pink
  rect(80, 130, 12, 12);
  fill(0, 0, 0);
  text("Messages", 98, 140);
  fill(242, 62, 12);
  rect(80, 150, 12, 12);
  fill(0, 0, 0);
  text("Events", 98, 161);
  text("1", 230, 164);
  //end newsfeed/messages/events

  fill(173, 176, 180);//grey
  text("GROUPS", 80, 200);
  fill(255);
  rect(80, 215, 12, 12);
  fill(140, 144, 142);
  rect(80, 235, 12, 12);
  fill(53, 107, 180);
  rect(80, 255, 12, 12);

  fill(173, 176, 180);//grey
  text("APPS", 80, 290);
  fill(61, 80, 134);
  rect(80, 305, 12, 12);
  fill(255);
  rect(80, 325, 12, 12);
  fill(53, 107, 180);
  rect(80, 345, 12, 12);
  fill(255, 172, 62);//orange
  rect(80, 365, 12, 12);
  fill(53, 107, 180);
  rect(80, 385, 12, 12);
  fill(255, 206, 223);//pink
  rect(80, 405, 12, 12);
  fill(0, 0, 0);
  rect(80, 425, 12, 12);

  fill(173, 176, 180);//grey
  text("FRIENDS", 80, 460);
  fill(240, 206, 121);
  rect(80, 475, 12, 12);
  fill(90, 90, 89);
  rect(80, 495, 12, 12);

  fill(0, 0, 0);
  text("USC IMGD", 98, 225);
  text("IMD MFA NOW", 98, 245);
  text("My Little Pony", 98, 265);
  text("Games", 98, 315);
  text("Pokes", 98, 335);
  text("Saved", 98, 355);
  text("Photos", 98, 375);
  text("Music", 98, 395);
  text("Gifts", 98, 415);
  text("Games Feed", 98, 435);
  text("Family", 98, 485);
  text("University of South...", 98, 505);
  //end left side buttons







  //START MOVEMENT


  time++;
 

  fill(255);
  rect(250, 140+hhh, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+hhh);
  fill(0, 0, 0);
  textSize(14);
  text("Wow. Literally no one uses facebook anymore", 350, 200+hhh);
  if (time>8850) {
    hhh+=0.7;
  }

  //2037
  fill(255);
  rect(250, 140+ggg, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2037", 470, 200+ggg);
  if (time>8700) {
    ggg+=0.7;
  }
  //2037

    //2036
  fill(255);
  rect(250, 140+fff, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2036", 470, 200+fff);
  if (time>8550) {
    fff+=0.7;
  }
  //2036

  //2035
  fill(255);
  rect(250, 140+eee, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2035", 470, 200+eee);
  if (time>8400) {
    eee+=0.7;
  }
  //2035


  fill(255);
  rect(250, 140+ddd, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+ddd);
  fill(0, 0, 0);
  textSize(14);
  text("So tired. Crying baby.", 430, 200+ddd);
  if (time>8250) {
    ddd+=0.7;
  }

  //2034
  fill(255);
  rect(250, 140+ccc, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2034", 470, 200+ccc);
  if (time>8100) {
    ccc+=0.7;
  }
  //2034

  fill(255);
  rect(250, 140+bbb, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("James became a", 390, 200+bbb);
  fill(53, 107, 180);
  text("father", 555, 200+bbb);
  if (time>7950) {
    bbb+=0.7;
  }

  //2033
  fill(255);
  rect(250, 140+aaa, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2033", 470, 200+aaa);
  if (time>7800) {
    aaa+=0.7;
  }
  //2033

  fill(255);
  rect(250, 140+zz, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+zz);
  fill(0, 0, 0);
  textSize(14);
  text("Bobisley is pregnant!", 430, 200+zz);
  if (time>7650) {
    zz+=0.7;
  }

  fill(255);
  rect(250, 140+yy, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+yy);
  fill(0, 0, 0);
  textSize(14);
  text("I have something important to tell you when you get home.", 300, 200+yy);
  if (time>7500) {
    yy+=0.7;
  }

  fill(255);
  rect(250, 140+xx, 500, 100);
  fill(222, 114, 161);
  textSize(20);
  text("James and Bobisley are MARRIED", 340, 200+xx);
  if (time>7350) {
    xx+=0.7;
  }

  //2032
  fill(255);
  rect(250, 140+ww, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2032", 470, 200+ww);
  if (time>7200) {
    ww+=0.7;
  }
  //2032

  fill(255);
  rect(250, 140+vv, 500, 100);
  fill(222, 114, 161);
  textSize(20);
  text("James and Bobisley are ENGAGED", 335, 200+vv);
  if (time>7050) {
    vv+=0.7;
  }

  fill(255);
  rect(250, 140+uu, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+uu);
  fill(0, 0, 0);
  textSize(14);
  text("I love you, too.", 440, 200+uu);
  if (time>6900) {
    uu+=0.7;
  }

  fill(255);
  rect(250, 140+tt, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James -> Bobisley", 420, 170+tt);
  fill(0, 0, 0);
  textSize(14);
  text("I love you.", 465, 200+tt);
  if (time>6750) {
    tt+=0.7;
  }

  //2031
  fill(255);
  rect(250, 140+ss, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2031", 470, 200+ss);
  if (time>6600) {
    ss+=0.7;
  }
  //2031

  fill(255);
  rect(250, 140+rr, 500, 100);
  fill(222, 114, 161);
  textSize(20);
  text("James and Bobisley are in a relationship", 305, 200+rr);
  if (time>6450) {
    rr+=0.7;
  }

  fill(255);
  rect(250, 140+qq, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+qq);
  fill(0, 0, 0);
  textSize(14);
  text("I feel like we still have so much in common.", 350, 200+qq);
  if (time>6300) {
    qq+=0.7;
  }

  //2030
  fill(255);
  rect(250, 140+pp, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2030", 470, 200+pp);
  if (time>6150) {
    pp+=0.7;
  }
  //2030

  fill(255);
  rect(250, 140+oo, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James -> Bobisley", 420, 170+oo);
  fill(0, 0, 0);
  textSize(14);
  text("Yeah! We should hang out soon.", 390, 200+oo);
  if (time>6000) {
    oo+=0.7;
  }

  fill(255);
  rect(250, 140+nn, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+nn);
  fill(0, 0, 0);
  textSize(14);
  text("It was nice running into you last night after so many years!", 300, 200+nn);
  if (time>5850) {
    nn+=0.7;
  }

  //2029
  fill(255);
  rect(250, 140+mm, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2029", 470, 200+mm);
  if (time>5700) {
    mm+=0.7;
  }
  //2029

  fill(255);
  rect(250, 140+ll, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+ll);
  fill(0, 0, 0);
  textSize(14);
  text("Got promoted at my job!", 420, 200+ll);
  if (time>5550) {
    ll+=0.7;
  }

  fill(255);
  rect(250, 140+kk, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("James is SINGLE.", 420, 200+kk);
  if (time>5400) {
    kk+=0.7;
  }

  fill(255);
  rect(250, 140+jj, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Katy -> James", 440, 170+jj);
  fill(0, 0, 0);
  textSize(14);
  text("I don't love you anymore.", 410, 200+jj);
  if (time>5250) {
    jj+=0.7;
  }

  //2028
  fill(255);
  rect(250, 140+ii, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2028", 470, 200+ii);
  if (time>5100) {
    ii+=0.7;
  }
  //2028

  fill(255);
  rect(250, 140+hh, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James -> Katy", 440, 170+hh);
  fill(0, 0, 0);
  textSize(14);
  text("I love you.", 465, 200+hh);
  if (time>4950) {
    hh+=0.7;
  }


  fill(255);
  rect(250, 140+gg, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+gg);
  fill(0, 0, 0);
  textSize(14);
  text("I got a job!", 465, 200+gg);
  if (time>4800) {
    gg+=0.7;
  }

  //2027
  fill(255);
  rect(250, 140+ff, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2027", 470, 200+ff);
  if (time>4650) {
    ff+=0.7;
  }
  //2027


    fill(255);
  rect(250, 140+ee, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+ee);
  fill(0, 0, 0);
  textSize(14);
  text("Still no job.", 465, 200+ee);
  if (time>4500) {
    ee+=0.7;
  }

  fill(255);
  rect(250, 140+dd, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+dd);
  fill(0, 0, 0);
  textSize(14);
  text("Ugh no job.", 465, 200+dd);
  if (time>4350) {
    dd+=0.7;
  }

  fill(255);
  rect(250, 140+cc, 500, 100);
  fill(242, 62, 12);
  textSize(20);
  text("James graduated from USC", 370, 200+cc);
  if (time>4200) {
    cc+=0.7;
  }

  fill(255);
  rect(250, 140+bb, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+bb);
  fill(0, 0, 0);
  textSize(14);
  text("OMG so much undergraduate thesis. Dying.", 350, 200+bb);
  if (time>4050) {
    bb+=0.7;
  }

  //2026
  fill(255);
  rect(250, 140+aa, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2026", 470, 200+aa);
  if (time>3900) {
    aa+=0.7;
  }
  //2026

  fill(255);
  rect(250, 140+z, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+z);
  fill(0, 0, 0);
  textSize(14);
  text("happy new year!", 450, 200+z);
  if (time>3750) {
    z+=0.7;
  }


  fill(255);
  rect(250, 140+y, 500, 100);
  fill(222, 114, 161);//pink
  stroke(0, 0, 0);
  rect(480, 160+y, 35, 35);
  fill(0, 0, 0);
  noStroke();
  ellipse(490, 172+y, 5, 10);
  ellipse(505, 172+y, 5, 10);
  noFill();
  stroke(0, 0, 0);
  arc(497, 183+y, 20, 20, 0, PI);
  fill(0, 0, 0);
  textSize(20);
  text("James uploaded a photo", 380, 220+y);
  if (time>3600) {
    y+=0.7;
  }

  noStroke();
  fill(255);
  rect(250, 140+x, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+x);
  fill(0, 0, 0);
  textSize(14);
  text("Ahhh...summer romance", 420, 200+x);
  if (time>3450) {
    x+=0.7;
  }

  fill(255);
  rect(250, 140+w, 500, 100);
  fill(222, 114, 161);
  textSize(20);
  text("James and Katy are in a relationship", 330, 200+w);
  if (time>3300) {
    w+=0.7;
  }

  fill(255);
  rect(250, 140+v, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James -> Katy", 440, 170+v);
  fill(0, 0, 0);
  textSize(14);
  text("It was fun meeting you at that party. Wanna get a drink?", 310, 200+v);
  if (time>3150) {
    v+=0.7;
  }

  fill(255);
  rect(250, 140+u, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+u);
  fill(0, 0, 0);
  textSize(14);
  text("I can't believe I'm a junior in college already!", 350, 200+u);
  if (time>3000) {
    u+=0.7;
  }


  //2025
  fill(255);
  rect(250, 140+t, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2025", 470, 200+t);
  if (time>2850) {
    t+=0.7;
  }
  //2025

  fill(255);
  rect(250, 140+s, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+s);
  fill(0, 0, 0);
  textSize(14);
  text("Summer break! aahhh", 430, 200+s);
  if (time>2700) {
    s+=0.7;
  }

  fill(255);
  rect(250, 140+r, 500, 100);
  fill(218, 148, 219);//purple
  stroke(0, 0, 0);
  rect(480, 160+r, 35, 35);
  fill(0, 0, 0);
  noStroke();
  ellipse(490, 172+r, 5, 10);
  ellipse(505, 172+r, 5, 10);
  noFill();
  stroke(0, 0, 0);
  arc(497, 183+r, 20, 20, 0, PI);
  fill(0, 0, 0);
  textSize(20);
  text("James uploaded a photo", 380, 220+r);
  if (time>2550) {
    r+=0.7;
  }

  //2024
  noStroke();
  fill(255);
  rect(250, 140+q, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2024", 470, 200+q);
  if (time>2400) {
    q+=0.7;
  }
  //2024

  fill(255);
  rect(250, 140+p, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("James is SINGLE.", 420, 200+p);
  if (time>2250) {
    p+=0.7;
  }

  //2023
  fill(255);
  rect(250, 140+o, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2023", 470, 200+o);
  if (time>2100) {
    o+=0.7;
  }
  //2023

  fill(255);
  rect(250, 140+n, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+n);
  fill(0, 0, 0);
  textSize(14);
  text("We don't talk anymore", 415, 200+n);
  if (time>1950) {
    n+=0.7;
  }

  fill(255);
  rect(250, 140+m, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("James started at USC", 390, 200+m);
  if (time>1800) {
    m+=0.7;
  }


  fill(255);
  rect(250, 140+l, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("James graduated from high school", 330, 200+l);
  if (time>1650) {
    l+=0.7;
  }

  fill(255);
  rect(250, 140+k, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James", 480, 170+k);
  fill(0, 0, 0);
  textSize(14);
  text("Got into USC!", 460, 200+k);
  if (time>1500) {
    k+=0.7;
  }

  //2022
  fill(255);
  rect(250, 140+j, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2022", 470, 200+j);
  if (time>1350) {
    j+=0.7;
  }
  //2022

  fill(255);
  rect(250, 140+i, 500, 100);
  fill(222, 114, 161);
  textSize(20);
  text("James and Bobisley are in a relationship", 305, 200+i);
  if (time>1200) {
    i+=0.7;
  }

  fill(255);
  rect(250, 140+h, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("James -> Bobisley", 420, 170+h);
  fill(0, 0, 0);
  textSize(14);
  text("Not as hard as me! ... jk", 410, 200+h);
  if (time>1050) {
    h+=0.7;
  }

  fill(255);
  rect(250, 140+g, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+g);
  fill(0, 0, 0);
  textSize(14);
  text("That trig homework was hard!", 390, 200+g);
  if (time>900) {
    g+=0.7;
  }


  //2021
  fill(255);
  rect(250, 140+f, 500, 100);
  fill(0, 0, 0);
  textSize(20);
  text("2021", 470, 200+f);
  if (time>750) {
    f+=0.7;
  }
  //2021


  fill(255);
  rect(250, 140+e, 500, 100);
  fill(53, 107, 180); //blue
  textSize(16);
  text("Bobisley -> James", 420, 170+e);
  fill(0, 0, 0);
  textSize(14);
  text("Hey! ;)", 480, 200+e);
  if (time>600) {
    e+=0.7;
  }

  fill(255);
  rect(250, 140+d, 500, 100);
  fill(0, 0, 0);
  textSize(16);
  text("James became friends with Bobisley Edwards", 320, 200+d);
  if (time>450) {
    d+=0.7;
  }


  fill(255);
  rect(250, 140+c, 500, 100);
  fill(0, 0, 0);
  textSize(18);
  text("James joined Calabasas High School class of 2022", 280, 195+c);
  if (time>300) {
    c+=0.7;
  }

  //join facebook
  fill(255);
  rect(250, 140+b, 500, 100);
  fill(255, 253, 211);//yellow
  stroke(0, 0, 0);
  rect(480, 160+b, 35, 35);
  fill(0, 0, 0);
  noStroke();
  ellipse(490, 172+b, 5, 10);
  ellipse(505, 172+b, 5, 10);
  noFill();
  stroke(0, 0, 0);
  arc(497, 183+b, 20, 20, 0, PI);
  fill(53, 107, 180);
  textSize(20);
  text("James Morse Joined Facebook", 360, 220+b);
  if (time>150) {
    b+=0.7;
  }

  //2020
  noStroke();
  fill(255);
  rect(250, 140+a, 500, 100);
  fill(0, 0, 0);
  text("2020", 470, 200+a);
  if (time>0) {
    a+=0.7;
  }
//2020  

  if (time>9150) {
    fill(0, 0, 0, 255);
    rect(0, 0, 1130, 700);
  }

  if (time>9100) {
    fill(0, 0, 0, 191);
    rect(0, 0, 1130, 700);
  }

  if (time>9050) {
    fill(0, 0, 0, 127);
    rect(0, 0, 1130, 700);
  }

  if (time>9000) {
    fill(0, 0, 0, 63);
    rect(0, 0, 1130, 700);
  }
}

