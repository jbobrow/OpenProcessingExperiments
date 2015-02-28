
PFont font;
PImage sharp;
PImage flat;

int x = 165;
int y = 670;
int circle = 12;

void setup(){
  size(1350,750);
  font = loadFont("MyriadPro.vlw");
  sharp = loadImage("sharp.gif");
  flat = loadImage("flat.gif");
}

void draw() {
  background(255);
  noSmooth();

  // TITLE & EXPLANATION
  pushMatrix();
  rotate(-PI/2);
  fill(180);
  textAlign(LEFT,TOP);
  textFont(font,25.75);
  text("C   H   O   R   D       P   R   O   G   R   E   S   S   I   O   N   S", -710,30);
  textFont(font,17.8);
  text("A     G u i d e     t o     C o m p o s i t i o n     i n     P o p u l a r     M u s i c",-708,58);
  popMatrix();
  fill(80);
  textFont(font,9);
  text("This information graphic maps out the various chord sequences of several songs in popular music. Methods for composing music have changed drastically over time and across styles, and they range from being technically complicated to incredibly simple.  Some songs bounce between numerous chords and may not follow any distinct patters, while others may only use one or two chords that are repeated many times over.  There are certainly some progressions that have proven to be success- ful that songwriters habitually make use of, and this chart shows the similarities between many songs' compositions, as well as those that do go outside of conventional arrangements.",20,20,480,250);
  text("The songs included in this graphic are the longest-running number-one singles of each year of the Billboard Hot 100 from 1958 to today. The underlying grid incorporates chords on the vertical axis and measures on the horizontal axis; the chart does not necessarily show all of the chords throughout the entire song, but what is displayed are the fundamental patterns that are repeated within each song. The boxes on the right highlight different groups of songs that reveal interesting patterns about common chord progressions, and the potentiometer scrolls through every song individually in chronological order.",20,104,480,100);
  
  // GRID
  strokeWeight(1);
  stroke(220);
  for (int i = y; i > 220; i -= 60) {
    line(x-27,i,x+1160,i);
    line(x-27,i-20,x+1160,i-20);
  }
  for (int i = x; i < 1320; i += 40) {
    line(i,y+30,i,y-470);
  }
  stroke(0);
  strokeWeight(1.5);
  line(x-27,y+30,x+1160,y+30);
  line(x-27,y-470,x+1160,y-470);
  
  int textX = x-45;
  fill(0);
  textFont(font, 14);
  textAlign(CENTER, CENTER);
  text("I",textX,y);
  text("i",textX,y-22);
  text("II",textX,y-60);
  text("ii",textX,y-82);
  text("III",textX,y-120);
  text("iii",textX,y-142);
  text("IV",textX,y-180);
  text("iv",textX,y-202);
  text("V",textX,y-240);
  text("v",textX,y-262);
  text("VI",textX,y-300);
  text("vi",textX,y-322);
  text("VII",textX,y-360);
  text("vii",textX,y-382);
  text("I",textX,y-420);
  text("i",textX,y-442);
  
  
  // All songs are mapped out in the background in a very light stroke.
  noFill();
  strokeWeight(.1);
  smooth();
  strokeJoin(ROUND);

  At_the_Hop();
  Mack_the_Knife();
  Theme_from_A_Summer_Place();
  Tossin_and_Turnin();
  Sherry();
  Sugar_Shack();
  I_Want_to_Hold_Your_Hand();
  I_Cant_Get_No_Satisfaction();
  Im_a_Believer();
  To_Sir_With_Love();
  Hey_Jude();
  In_the_Year_2525_Exordium_and_Terminus();
  Bridge_Over_Troubled_Water();
  Joy_to_the_World();
  The_First_Time_Ever_I_Saw_Your_Face();
  My_Love();
  Seasons_in_the_Sun();
  Love_Will_Keep_Us_Together();
  Tonights_the_Night_Gonna_Be_Alright();
  You_Light_Up_My_Life();
  Night_Fever();
  My_Sharona();
  Call_Me();
  Physical();
  I_Love_Rock_n_Roll();
  Every_Breath_You_Take();
  Like_a_Virgin();
  Say_You_Say_Me();
  Walk_Like_an_Egyptian();
  Livin_on_a_Prayer();
  Roll_With_It();
  Another_Day_in_Paradise();
  Because_I_Love_You_The_Postmas_Song();
  Black_or_White();
  I_Will_Always_Love_You();
  Thats_the_Way_Love_Goes();
  Ill_Make_Love_to_You();
  One_Sweet_Day();
  Macarena_Bayside_Boys_Mix();
  Something_About_the_Way_You_Look_Tonight();
  The_Boy_is_Mine();
  Smooth_Santana();
  Maria_Maria();
  All_For_You();
  Lose_Yourself();
  In_Da_Club();
  Yeah();
  We_Belong_Together();
  Irreplaceable();
  Umbrella();
  Low();
  I_Gotta_Feeling();
  Tik_Tok();
  We_Found_Love();
  Call_Me_Maybe();
  
  
  // KEY REFERENCE
  // The color chart indicates the specific key of each song.
  int keyColorsX = 900;
  int keyColorsY = 20;
  
  fill(0);
  textAlign(LEFT,TOP);
  textFont(font,9);
  text("The color of a song's line of chords indi- cates the song's key.",keyColorsX-362,keyColorsY+4,85,40);
  textFont(font,14);
  text("Minor",keyColorsX-261,keyColorsY+5);
  text("Major",keyColorsX-261,keyColorsY+27);
  noFill();
  strokeWeight(1);
  stroke(0);
  beginShape();
  vertex(keyColorsX-267,keyColorsY+8);
  vertex(keyColorsX-273,keyColorsY+8);
  vertex(keyColorsX-273,keyColorsY+34);
  vertex(keyColorsX-267,keyColorsY+34);
  endShape();
  fill(0);
  textFont(font,12);
  text("C",keyColorsX-215,keyColorsY+45);
  image(sharp,keyColorsX-190,keyColorsY+42,6,12);
  text("C",keyColorsX-198,keyColorsY+45);
  image(flat,keyColorsX-188,keyColorsY+58,6,13);
  text("D",keyColorsX-198,keyColorsY+61);
  text("D",keyColorsX-175,keyColorsY+45);
  image(sharp,keyColorsX-149,keyColorsY+42,6,12);
  text("D",keyColorsX-158,keyColorsY+45);
  image(flat,keyColorsX-149,keyColorsY+58,6,13);
  text("E",keyColorsX-157,keyColorsY+61);
  text("E",keyColorsX-135,keyColorsY+45);
  text("F",keyColorsX-115,keyColorsY+45);
  image(sharp,keyColorsX-89,keyColorsY+42,6,12);
  text("F",keyColorsX-96,keyColorsY+45);
  image(flat,keyColorsX-88,keyColorsY+58,6,13);
  text("G",keyColorsX-97,keyColorsY+61);
  text("G",keyColorsX-75,keyColorsY+45);
  image(sharp,keyColorsX-48,keyColorsY+42,6,12);
  text("G",keyColorsX-57,keyColorsY+45);
  image(flat,keyColorsX-48,keyColorsY+58,6,13);
  text("A",keyColorsX-57,keyColorsY+61);
  text("A",keyColorsX-35,keyColorsY+45);
  image(sharp,keyColorsX-10,keyColorsY+42,6,12);
  text("A",keyColorsX-18,keyColorsY+45);
  image(flat,keyColorsX-9,keyColorsY+58,6,13);
  text("B",keyColorsX-17,keyColorsY+61);
  text("B",keyColorsX+5,keyColorsY+45);
  
  noStroke();
  strokeJoin(MITER);
  int rectSize = 20;
  // B
  fill(123,57,97);
  rect(keyColorsX,keyColorsY,rectSize,rectSize);
  fill(211,103,162);
  rect(keyColorsX,keyColorsY+rectSize,rectSize,rectSize);
  // A#/Bb
  fill(107,39,90);
  rect(keyColorsX-rectSize,keyColorsY,rectSize,rectSize);
  fill(180,76,151);
  rect(keyColorsX-rectSize,keyColorsY+rectSize,rectSize,rectSize);
  // A
  fill(89,39,91);
  rect(keyColorsX-rectSize*2,keyColorsY,rectSize,rectSize);
  fill(149,75,151);
  rect(keyColorsX-rectSize*2,keyColorsY+rectSize,rectSize,rectSize);
  // G#/Ab
  fill(47,57,103);
  rect(keyColorsX-rectSize*3,keyColorsY,rectSize,rectSize);
  fill(81,100,170);
  rect(keyColorsX-rectSize*3,keyColorsY+rectSize,rectSize,rectSize);
  // G
  fill(0,88,111);
  rect(keyColorsX-rectSize*4,keyColorsY,rectSize,rectSize);
  fill(17,146,183);
  rect(keyColorsX-rectSize*4,keyColorsY+rectSize,rectSize,rectSize);
  // F#/Gb
  fill(52,108,94);
  rect(keyColorsX-rectSize*5,keyColorsY,rectSize,rectSize);
  fill(92,178,156);
  rect(keyColorsX-rectSize*5,keyColorsY+rectSize,rectSize,rectSize);
  // F
  fill(80,113,46);
  rect(keyColorsX-rectSize*6, keyColorsY, rectSize, rectSize);
  fill(140, 189, 79);
  rect(keyColorsX-rectSize*6, keyColorsY+rectSize, rectSize, rectSize);
  // E
  fill(106,122,40);
  rect(keyColorsX-rectSize*7,keyColorsY,rectSize,rectSize);
  fill(186,209,71);
  rect(keyColorsX-rectSize*7,keyColorsY+rectSize,rectSize,rectSize);
  // D#/Eb
  fill(134,134,32);
  rect(keyColorsX-rectSize*8,keyColorsY,rectSize,rectSize);
  fill(235,231,56);
  rect(keyColorsX-rectSize*8,keyColorsY+rectSize,rectSize,rectSize);
  // D
  fill(137,112,30);
  rect(keyColorsX-rectSize*9,keyColorsY,rectSize,rectSize);
  fill(238,192,57);
  rect(keyColorsX-rectSize*9,keyColorsY+rectSize,rectSize,rectSize);
  // C#/Db
  fill(125,70,29);
  rect(keyColorsX-rectSize*10,keyColorsY,rectSize,rectSize);
  fill(217,120,58);
  rect(keyColorsX-rectSize*10,keyColorsY+rectSize,rectSize,rectSize);
  // C
  fill(120,36,23);
  rect(keyColorsX-rectSize*11,keyColorsY,rectSize,rectSize);
  fill(207,66,51);
  rect(keyColorsX-rectSize*11,keyColorsY+rectSize,rectSize,rectSize);
  
  
  int button = 15;
  textAlign(LEFT,TOP);
  fill(140);
  textFont(font,9);
  text("Move the mouse over the chart on the left to see songs by decade and individual songs. Move the mouse over the boxes on the right to see songs by gen- re. Press the UP arrow key to see all major songs and the DOWN to see all minor songs.",1140,24,86,160);
  
  // GENRES
  // These buttons highlight songs in pop, rock, R&B, hip hop, and folk genres.
  int genresX = 1250;
  int genresY = 20;
  noFill();
  strokeWeight(5);
  stroke(140);
  rect(genresX,genresY+25,button,button);
  rect(genresX,genresY+52,button,button);
  rect(genresX,genresY+79,button,button);
  rect(genresX,genresY+106,button,button);
  rect(genresX,genresY+133,button,button);
  fill(0);
  textFont(font,16);
  text("GENRES",genresX,genresY);
  textFont(font,14);
  text("Pop",genresX+23,genresY+27);
  text("Rock",genresX+23,genresY+54);
  text("R&B",genresX+23,genresY+81);
  text("Hip hop",genresX+23,genresY+108);
  textFont(font,10.5);
  text("Folk/",genresX+23,genresY+132);
  text("instrumental",genresX+23,genresY+143);
  noFill();
  strokeWeight(1.5);
  // POP
  if (mouseX > genresX && mouseX < genresX+15){
    if (mouseY > genresY+25 && mouseY < genresY+40){
      Mack_the_Knife();
      To_Sir_With_Love();
      The_First_Time_Ever_I_Saw_Your_Face();
      Seasons_in_the_Sun();
      Love_Will_Keep_Us_Together();
      Night_Fever();
      Physical();
      Like_a_Virgin();
      Say_You_Say_Me();
      Roll_With_It();
      Another_Day_in_Paradise();
      Because_I_Love_You_The_Postmas_Song();
      Black_or_White();
      I_Will_Always_Love_You();
      Macarena_Bayside_Boys_Mix();
      Something_About_the_Way_You_Look_Tonight();
      Smooth_Santana();
      Maria_Maria();
      All_For_You();
      Umbrella();
      I_Gotta_Feeling();
      Tik_Tok();
      We_Found_Love();
      Call_Me_Maybe();
    }
  } // ROCK
  if (mouseX > genresX && mouseX < genresX+15){
    if (mouseY > genresY+50 && mouseY < genresY+65){
      At_the_Hop();
      Tossin_and_Turnin();
      Sherry();
      Sugar_Shack();
      I_Want_to_Hold_Your_Hand();
      I_Cant_Get_No_Satisfaction();
      Im_a_Believer();
      Hey_Jude();
      In_the_Year_2525_Exordium_and_Terminus();
      Joy_to_the_World();
      My_Love();
      Tonights_the_Night_Gonna_Be_Alright();
      My_Sharona();
      Call_Me();
      I_Love_Rock_n_Roll();
      Every_Breath_You_Take();
      Walk_Like_an_Egyptian();
      Livin_on_a_Prayer();
    }
  } // R&B
  if (mouseX > genresX && mouseX < genresX+15){
    if (mouseY > genresY+76 && mouseY < genresY+91){
      Thats_the_Way_Love_Goes();
      Ill_Make_Love_to_You();
      One_Sweet_Day();
      The_Boy_is_Mine();
      We_Belong_Together();
      Irreplaceable();
    }
  } // HIP HOP
  if (mouseX > genresX && mouseX < genresX+15){
    if (mouseY > genresY+102 && mouseY < genresY+117){
      Lose_Yourself();
      In_Da_Club();
      Yeah();
      Low();
    }
  } // FOLK/INSTRUMENTAL
  if (mouseX > genresX && mouseX < genresX+15){
    if (mouseY > genresY+128 && mouseY < genresY+143){
      Theme_from_A_Summer_Place();
      Bridge_Over_Troubled_Water();
      You_Light_Up_My_Life();
    }
  }
  
  // KEYS
  // These buttons highlight songs in major and minor keys.
  noFill();
  strokeWeight(1.5);
  if (keyPressed){
    if (key == CODED){
      // MINOR
      if (keyCode == DOWN){
        In_the_Year_2525_Exordium_and_Terminus();
        My_Sharona();
        Call_Me();
        Physical();
        I_Love_Rock_n_Roll();
        Livin_on_a_Prayer();
        Another_Day_in_Paradise();
        Thats_the_Way_Love_Goes();
        The_Boy_is_Mine();
        Smooth_Santana();
        Maria_Maria();
        Lose_Yourself();
        In_Da_Club();
        Yeah();
        Low();
        Tik_Tok();
      } // MAJOR
      if (keyCode == UP){
        At_the_Hop();
        Mack_the_Knife();
        Theme_from_A_Summer_Place();
        Tossin_and_Turnin();
        Sherry();
        Sugar_Shack();
        I_Want_to_Hold_Your_Hand();
        I_Cant_Get_No_Satisfaction();
        Im_a_Believer();
        To_Sir_With_Love();
        Hey_Jude();
        Bridge_Over_Troubled_Water();
        Joy_to_the_World();
        The_First_Time_Ever_I_Saw_Your_Face();
        My_Love();
        Seasons_in_the_Sun();
        Love_Will_Keep_Us_Together();
        Tonights_the_Night_Gonna_Be_Alright();
        You_Light_Up_My_Life();
        Night_Fever();
        Every_Breath_You_Take();
        Like_a_Virgin();
        Say_You_Say_Me();
        Walk_Like_an_Egyptian();
        Roll_With_It();
        Because_I_Love_You_The_Postmas_Song();
        Black_or_White();
        I_Will_Always_Love_You();
        Ill_Make_Love_to_You();
        One_Sweet_Day();
        Macarena_Bayside_Boys_Mix();
        Something_About_the_Way_You_Look_Tonight();
        All_For_You();
        We_Belong_Together();
        Irreplaceable();
        Umbrella();
        I_Gotta_Feeling();
        We_Found_Love();
        Call_Me_Maybe();
      }
    }
  }
  
  // CHRONOLOGY
  strokeWeight(2);
  stroke(100);
  int timeX = 980;
  int timeY = 53;
  int timeRectX = 20;
  int timeRectY = 9;
  for (int i = timeY-18; i < 50; i += timeRectY){
    rect(timeX,i,timeRectX,timeRectY);
  } for (int i = timeY+90; i < 165; i += timeRectY){
    rect(timeX+120,i,timeRectX,timeRectY);
  }
  for (int i = timeX; i < 1120; i += (timeRectX+10)){
    for (int n = timeY; n < 140; n += timeRectY){
      rect(i,n,timeRectX,timeRectY);
    }
  }
  fill(0);
  textFont(font,16);
  text("CHRONOLOGY",timeX+37,timeY-33);
  fill(140);
  textFont(font,11.5);
  text("1958",timeX-2,timeY-30);
  text("1970",timeX+27,timeY-12);
  text("1980",timeX+57,timeY-12);
  text("1990",timeX+87,timeY-12);
  text("2000",timeX+117,timeY-12);
  
  noFill();
  int songX = 538;
  int songY = 100;
  
  if (mouseX > timeX && mouseX < timeX+20){
    if (mouseY > timeY-27 && mouseY < timeY+90){
      fill(225,0,0);
      textFont(font,20);
      text("1960-1969",timeX+20,timeY+103);
      noFill();
      strokeWeight(1.5);
      At_the_Hop();
      Mack_the_Knife();
      Theme_from_A_Summer_Place();
      Tossin_and_Turnin();
      Sherry();
      Sugar_Shack();
      I_Want_to_Hold_Your_Hand();
      I_Cant_Get_No_Satisfaction();
      Im_a_Believer();
      To_Sir_With_Love();
      Hey_Jude();
      In_the_Year_2525_Exordium_and_Terminus();
    } strokeWeight(6.5);
    if (mouseY > timeY-18 && mouseY < timeY-9){
      At_the_Hop();
      //textFont(font,14);
      //fill(0);
      strokeWeight(1);
      Verse_Chorus_Coda();
      fill(81,100,170);
      textFont(font,20);
      text("1958",songX,songY);
      textFont(font,30);
      text("''At the Hop''",songX-12,songY+23);
      textFont(font,18);
      text("Danny and the Juniors",songX,songY+54);
    } if (mouseY > timeY-9 && mouseY < timeY){
      Mack_the_Knife();
      longVerse();
      fill(180,76,151);
      textFont(font,20);
      text("1959",songX,songY);
      textFont(font,30);
      text("''Mack the Knife''",songX-12,songY+23);
      textFont(font,18);
      text("Bobby Darin",songX,songY+54);
    } if (mouseY > timeY && mouseY < timeY+9){
      Theme_from_A_Summer_Place();
      longVerse_Bridge();
      fill(140,189,79);
      textFont(font,20);
      text("1960",songX,songY);
      textFont(font,30);
      text("''Theme from 'A Summer Place'''",songX-12,songY+23);
      textFont(font,18);
      text("Percy Faith",songX,songY+54);
    } if (mouseY > timeY+9 && mouseY < timeY+18){
      Tossin_and_Turnin();
      longVerse_Bridge();
      fill(207,66,51);
      textFont(font,20);
      text("1961",songX,songY);
      textFont(font,30);
      text("''Tossin' and Turnin'''",songX-12,songY+23);
      textFont(font,18);
      text("Bobby Lewis",songX,songY+54);
    } if (mouseY > timeY+18 && mouseY < timeY+27){
      Sherry();
      longVerse_Bridge();
      fill(207,66,51);
      textFont(font,20);
      text("1962",songX,songY);
      textFont(font,30);
      text("''Sherry''",songX-12,songY+23);
      textFont(font,18);
      text("The Four Seasons",songX,songY+54);
    } if (mouseY > timeY+27 && mouseY < timeY+36){
      Sugar_Shack();
      longVerse();
      fill(17,146,183);
      textFont(font,20);
      text("1963",songX,songY);
      textFont(font,30);
      text("''Sugar Shack''",songX-12,songY+23);
      textFont(font,18);
      text("Jimmy Gilmer and the Fireballs",songX,songY+54);
    } if (mouseY > timeY+36 && mouseY < timeY+45){
      I_Want_to_Hold_Your_Hand();
      Verse_Chorus_Bridge();
      fill(17,146,183);
      textFont(font,20);
      text("1964",songX,songY);
      textFont(font,30);
      text("''I Want to Hold Your Hand''",songX-12,songY+23);
      textFont(font,18);
      text("The Beatles",songX,songY+54);
    } if (mouseY > timeY+45 && mouseY < timeY+54){
      I_Cant_Get_No_Satisfaction();
      Verse_shortChorus();
      fill(186,209,71);
      textFont(font,20);
      text("1965",songX,songY);
      textFont(font,30);
      text("''(I Can't Get No) Satisfaction''",songX-12,songY+23);
      textFont(font,18);
      text("The Rolling Stones",songX,songY+54);
    } if (mouseY > timeY+54 && mouseY < timeY+63){
      Im_a_Believer();
      strokeWeight(1);
      stroke(0);
      noFill();
      beginShape();
      vertex(x,y+35);
      vertex(x,y+45);
      vertex(x+635,y+45);
      endShape();
      beginShape();
      vertex(x+640,y+35);
      vertex(x+640,y+45);
      vertex(x+1160,y+45);
      vertex(x+1160,y+35);
      endShape();
      textFont(font,14);
      fill(0);
      text("Verse",x+305,y+50);
      text("Chorus",x+885,y+50);
      fill(17,146,183);
      textFont(font,20);
      text("1966",songX,songY);
      textFont(font,30);
      text("''I'm a Believer''",songX-12,songY+23);
      textFont(font,18);
      text("The Monkees",songX,songY+54);
    } if (mouseY > timeY+63 && mouseY < timeY+72){
      To_Sir_With_Love();
      longVerse_Chorus();
      fill(149,75,151);
      textFont(font,20);
      text("1967",songX,songY);
      textFont(font,30);
      text("''To Sir With Love''",songX-12,songY+23);
      textFont(font,18);
      text("Lulu",songX,songY+54);
    } if (mouseY > timeY+72 && mouseY < timeY+81){
      Hey_Jude();
      Verse_Bridge_Coda();
      fill(140,189,79);
      textFont(font,20);
      text("1968",songX,songY);
      textFont(font,30);
      text("''Hey Jude''",songX-12,songY+23);
      textFont(font,18);
      text("The Beatles",songX,songY+54);
    } if (mouseY > timeY+81 && mouseY < timeY+90){
      In_the_Year_2525_Exordium_and_Terminus();
      longVerse();
      fill(47,57,103);
      textFont(font,20);
      text("1969",songX,songY);
      textFont(font,23);
      text("''In the Year 2525 (Exordium and Terminus)''",songX-7,songY+25);
      textFont(font,18);
      text("Zager and Evans",songX,songY+54);
    }
  } if (mouseX > timeX+30 && mouseX < timeX+50){
    if (mouseY > timeY-9 && mouseY < timeY+90){
      fill(225,175,0);
      textFont(font,20);
      text("1970-1979",timeX+20,timeY+103);
      noFill();
      strokeWeight(1.5);
      Bridge_Over_Troubled_Water();
      Joy_to_the_World();
      The_First_Time_Ever_I_Saw_Your_Face();
      My_Love();
      Seasons_in_the_Sun();
      Love_Will_Keep_Us_Together();
      Tonights_the_Night_Gonna_Be_Alright();
      You_Light_Up_My_Life();
      Night_Fever();
      My_Sharona();
    } strokeWeight(6.5);
    if (mouseY > timeY && mouseY < timeY+9){
      Bridge_Over_Troubled_Water();
      longVerse();
      fill(235,231,56);
      textFont(font,20);
      text("1970",songX,songY);
      textFont(font,30);
      text("''Bridge Over Troubled Water''",songX-12,songY+23);
      textFont(font,18);
      text("Simon and Garfunkel",songX,songY+54);
    } if (mouseY > timeY+9 && mouseY < timeY+18){
      Joy_to_the_World();
      Verse_Chorus_Bridge();
      fill(238,192,57);
      textFont(font,20);
      text("1971",songX,songY);
      textFont(font,30);
      text("''Joy to the World''",songX-12,songY+23);
      textFont(font,18);
      text("Three Dog Night",songX,songY+54);
    } if (mouseY > timeY+18 && mouseY < timeY+27){
      The_First_Time_Ever_I_Saw_Your_Face();
      longVerse_Coda();
      fill(207,66,51);
      textFont(font,20);
      text("1972",songX,songY);
      textFont(font,26);
      text("''The First Time Ever I Saw Your Face''",songX-9,songY+25);
      textFont(font,18);
      text("Roberta Flack",songX,songY+54);
    } if (mouseY > timeY+27 && mouseY < timeY+36){
      My_Love();
      longVerse_Bridge();
      fill(140,189,79);
      textFont(font,20);
      text("1973",songX,songY);
      textFont(font,30);
      text("''My Love''",songX-12,songY+23);
      textFont(font,18);
      text("Paul McCartney and Wings",songX,songY+54);
    } if (mouseY > timeY+36 && mouseY < timeY+45){
      Seasons_in_the_Sun();
      Verse_shortChorus();
      fill(92,178,156);
      textFont(font,20);
      text("1974",songX,songY);
      textFont(font,30);
      text("''Seasons in the Sun''",songX-12,songY+23);
      textFont(font,18);
      text("Terry Jacks",songX,songY+54);
    } if (mouseY > timeY+45 && mouseY < timeY+54){
      Love_Will_Keep_Us_Together();
      Verse_Chorus_Bridge();
      fill(211,103,162);
      textFont(font,20);
      text("1975",songX,songY);
      textFont(font,30);
      text("''Love Will Keep Us Together''",songX-12,songY+23);
      textFont(font,18);
      text("Captain & Tennille",songX,songY+54);
    } if (mouseY > timeY+54 && mouseY < timeY+63){
      Tonights_the_Night_Gonna_Be_Alright();
      Verse_shortChorus();
      fill(211,103,162);
      textFont(font,20);
      text("1976",songX,songY);
      textFont(font,24);
      text("''Tonight's the Night (Gonna Be Alright)''",songX-9,songY+25);
      textFont(font,18);
      text("Rod Stewart",songX,songY+54);
    } if (mouseY > timeY+63 && mouseY < timeY+72){
      You_Light_Up_My_Life();
      Verse_longChorus();
      fill(238,192,57);
      textFont(font,20);
      text("1977",songX,songY);
      textFont(font,30);
      text("''You Light Up My Life''",songX-12,songY+23);
      textFont(font,18);
      text("Debby Boone",songX,songY+54);
    } if (mouseY > timeY+72 && mouseY < timeY+81){
      Night_Fever();
      Verse_Chorus_Bridge();
      fill(186,209,71);
      textFont(font,20);
      text("1978",songX,songY);
      textFont(font,30);
      text("''Night Fever''",songX-12,songY+23);
      textFont(font,18);
      text("Bee Gees",songX,songY+54);
    } if (mouseY > timeY+81 && mouseY < timeY+90){
      My_Sharona();
      longVerse_Coda();
      fill(0,88,111);
      textFont(font,20);
      text("1979",songX,songY);
      textFont(font,30);
      text("''My Sharona''",songX-12,songY+23);
      textFont(font,18);
      text("The Knack",songX,songY+54);
    }
  } if (mouseX > timeX+60 && mouseX < timeX+80){
    if (mouseY > timeY-9 && mouseY < timeY+90){
      fill(0,200,0);
      textFont(font,20);
      text("1980-1989",timeX+20,timeY+103);
      noFill();
      strokeWeight(1.5);
      Call_Me();
      Physical();
      I_Love_Rock_n_Roll();
      Every_Breath_You_Take();
      Like_a_Virgin();
      Say_You_Say_Me();
      Walk_Like_an_Egyptian();
      Livin_on_a_Prayer();
      Roll_With_It();
      Another_Day_in_Paradise();
    } strokeWeight(6.5);
    if (mouseY > timeY && mouseY < timeY+9){
      Call_Me();
      Verse_Chorus_Bridge();
      fill(137,112,30);
      textFont(font,20);
      text("1980",songX,songY);
      textFont(font,30);
      text("''Call Me''",songX-12,songY+23);
      textFont(font,18);
      text("Blondie",songX,songY+54);
    } if (mouseY > timeY+9 && mouseY < timeY+18){
      Physical();
      Verse_shortChorus();
      fill(106,122,40);
      textFont(font,20);
      text("1981",songX,songY);
      textFont(font,30);
      text("''Physical''",songX-12,songY+23);
      textFont(font,18);
      text("Olivia Newton-John",songX,songY+54);
    } if (mouseY > timeY+18 && mouseY < timeY+27){
      I_Love_Rock_n_Roll();
      Verse_shortChorus();
      fill(106,122,40);
      textFont(font,20);
      text("1982",songX,songY);
      textFont(font,30);
      text("''I Love Rock 'n' Roll''",songX-12,songY+23);
      textFont(font,18);
      text("Joan Jett and the Blackhearts",songX,songY+54);
    } if (mouseY > timeY+27 && mouseY < timeY+36){
      Every_Breath_You_Take();
      Verse_Bridge1_Bridge2();
      fill(81,100,170);
      textFont(font,20);
      text("1983",songX,songY);
      textFont(font,30);
      text("''Every Breath You Take''",songX-12,songY+23);
      textFont(font,18);
      text("The Police",songX,songY+54);
    } if (mouseY > timeY+36 && mouseY < timeY+45){
      Like_a_Virgin();
      Verse_Chorus_Bridge();
      fill(92,178,156);
      textFont(font,20);
      text("1984",songX,songY);
      textFont(font,30);
      text("''Like a Virgin''",songX-12,songY+23);
      textFont(font,18);
      text("Madonna",songX,songY+54);
    } if (mouseY > timeY+45 && mouseY < timeY+54){
      Say_You_Say_Me();
      Verse_Chorus_Bridge();
      fill(81,100,170);
      textFont(font,20);
      text("1985",songX,songY);
      textFont(font,30);
      text("''Say You, Say Me''",songX-12,songY+23);
      textFont(font,18);
      text("Lionel Richie",songX,songY+54);
    } if (mouseY > timeY+54 && mouseY < timeY+63){
      Walk_Like_an_Egyptian();
      longVerse_Bridge();
      fill(211,103,162);
      textFont(font,20);
      text("1986",songX,songY);
      textFont(font,30);
      text("''Walk Like an Egyptian''",songX-12,songY+23);
      textFont(font,18);
      text("The Bangles",songX,songY+54);
    } if (mouseY > timeY+63 && mouseY < timeY+72){
      Livin_on_a_Prayer();
      Verse_Chorus_Bridge();
      fill(106,122,40);
      textFont(font,20);
      text("1987",songX,songY);
      textFont(font,30);
      text("''Livin' on a Prayer''",songX-12,songY+23);
      textFont(font,18);
      text("Bon Jovi",songX,songY+54);
    } if (mouseY > timeY+72 && mouseY < timeY+81){
      Roll_With_It();
      longVerse_Chorus();
      fill(17,146,183);
      textFont(font,20);
      text("1988",songX,songY);
      textFont(font,30);
      text("''Roll With It''",songX-12,songY+23);
      textFont(font,18);
      text("Steve Winwood",songX,songY+54);
    } if (mouseY > timeY+81 && mouseY < timeY+90){
      Another_Day_in_Paradise();
      Verse_Chorus_Bridge();
      fill(80,113,46);
      textFont(font,20);
      text("1989",songX,songY);
      textFont(font,30);
      text("''Another Day in Paradise''",songX-12,songY+23);
      textFont(font,18);
      text("Phil Collins",songX,songY+54);
    }
  } if (mouseX > timeX+90 && mouseX < timeX+110){
    if (mouseY > timeY-9 && mouseY < timeY+90){
      fill(0,0,255);
      textFont(font,20);
      text("1990-1999",timeX+20,timeY+103);
      noFill();
      strokeWeight(1.5);
      Because_I_Love_You_The_Postmas_Song();
      Black_or_White();
      I_Will_Always_Love_You();
      Thats_the_Way_Love_Goes();
      Ill_Make_Love_to_You();
      One_Sweet_Day();
      Macarena_Bayside_Boys_Mix();
      Something_About_the_Way_You_Look_Tonight();
      The_Boy_is_Mine();
      Smooth_Santana();
    } strokeWeight(6.5);
    if (mouseY > timeY && mouseY < timeY+9){  
      Because_I_Love_You_The_Postmas_Song();
      Verse_shortChorus();
      fill(217,120,58);
      textFont(font,20);
      text("1990",songX,songY);
      textFont(font,24);
      text("''Because I Love You (The Postman Song)''",songX-9,songY+25);
      textFont(font,18);
      text("Stevie B",songX,songY+54);
    } if (mouseY > timeY+9 && mouseY < timeY+18){
      Black_or_White();
      longVerse_Bridge();
      fill(186,209,71);
      textFont(font,20);
      text("1991",songX,songY);
      textFont(font,30);
      text("''Black or White''",songX-12,songY+23);
      textFont(font,18);
      text("Michael Jackson",songX,songY+54);
    } if (mouseY > timeY+18 && mouseY < timeY+27){
      I_Will_Always_Love_You();
      Verse_shortChorus();
      fill(149,75,151);
      textFont(font,20);
      text("1992",songX,songY);
      textFont(font,30);
      text("''I Will Always Love You''",songX-12,songY+23);
      textFont(font,18);
      text("Whitney Houston",songX,songY+54);
    } if (mouseY > timeY+27 && mouseY < timeY+36){
      Thats_the_Way_Love_Goes();
      Verse_Chorus_Bridge();
      fill(0,88,111);
      textFont(font,20);
      text("1993",songX,songY);
      textFont(font,30);
      text("''That's the Way Love Goes''",songX-12,songY+23);
      textFont(font,18);
      text("Janet Jackson",songX,songY+54);
    } if (mouseY > timeY+36 && mouseY < timeY+45){
      Ill_Make_Love_to_You();
      Verse_Chorus_Bridge();
      fill(238,192,57);
      textFont(font,20);
      text("1994",songX,songY);
      textFont(font,30);
      text("''I'll Make Love to You''",songX-12,songY+23);
      textFont(font,18);
      text("Boyz II Men",songX,songY+54);
    } if (mouseY > timeY+45 && mouseY < timeY+54){
      One_Sweet_Day();
      Verse_Chorus_Bridge();
      fill(81,100,170);
      textFont(font,20);
      text("1995",songX,songY);
      textFont(font,30);
      text("''One Sweet Day''",songX-12,songY+23);
      textFont(font,18);
      text("Mariah Carey & Boyz II Men",songX,songY+54);
    } if (mouseY > timeY+54 && mouseY < timeY+63){
      Macarena_Bayside_Boys_Mix();
      Verse_Chorus_Bridge();
      fill(81,100,170);
      textFont(font,20);
      text("1996",songX,songY);
      textFont(font,30);
      text("''Maracarena (Bayside Boys Mix)''",songX-12,songY+23);
      textFont(font,18);
      text("Los Del Rio",songX,songY+54);
    } if (mouseY > timeY+63 && mouseY < timeY+72){
      Something_About_the_Way_You_Look_Tonight();
      Verse_shortChorus();
      fill(92,178,156);
      textFont(font,20);
      text("1997",songX,songY);
      textFont(font,22);
      text("''Something About the Way You Look Tonight''",songX-7,songY+27);
      textFont(font,18);
      text("Elton John",songX,songY+54);
    } if (mouseY > timeY+72 && mouseY < timeY+81){
      The_Boy_is_Mine();
      Verse_shortChorus();
      fill(125,70,29);
      textFont(font,20);
      text("1998",songX,songY);
      textFont(font,30);
      text("''The Boy is Mine''",songX-12,songY+23);
      textFont(font,18);
      text("Brandy & Monica",songX,songY+54);
    } if (mouseY > timeY+81 && mouseY < timeY+90){
      Smooth_Santana();
      Verse_shortChorus();
      fill(89,39,91);
      textFont(font,20);
      text("1999",songX,songY);
      textFont(font,30);
      text("''Smooth''",songX-12,songY+23);
      textFont(font,18);
      text("Santana feat. Rob Thomas",songX,songY+54);
    }
  } if (mouseX > timeX+120 && mouseX < timeX+140){
    if (mouseY > timeY-9 && mouseY < timeY+117){
      fill(200,0,255);
      textFont(font,20);
      text("2000-2012",timeX+20,timeY+103);
      noFill();
      strokeWeight(1.5);
      Maria_Maria();
      All_For_You();
      Lose_Yourself();
      In_Da_Club();
      Yeah();
      We_Belong_Together();
      Irreplaceable();
      Umbrella();
      Low();
      I_Gotta_Feeling();
      Tik_Tok();
      We_Found_Love();
      Call_Me_Maybe();
    } strokeWeight(6.5);
    if (mouseY > timeY && mouseY < timeY+9){
      Maria_Maria();
      Verse_Chorus_Bridge();
      fill(89,39,91);
      textFont(font,20);
      text("2000",songX,songY);
      textFont(font,30);
      text("''Maria Maria''",songX-12,songY+23);
      textFont(font,18);
      text("Santana feat. The Product G&B",songX,songY+54);
    } if (mouseY > timeY+9 && mouseY < timeY+18){
      All_For_You();
      Verse_Chorus_Bridge();
      fill(17,146,183);
      textFont(font,20);
      text("2001",songX,songY);
      textFont(font,30);
      text("''All For You''",songX-12,songY+23);
      textFont(font,18);
      text("Janet Jackson",songX,songY+54);
    } if (mouseY > timeY+18 && mouseY < timeY+27){
      Lose_Yourself();
      Verse_shortChorus();
      fill(137,112,30);
      textFont(font,20);
      text("2002",songX,songY);
      textFont(font,30);
      text("''Lose Yourself''",songX-12,songY+23);
      textFont(font,18);
      text("Eminem",songX,songY+54);
    } if (mouseY > timeY+27 && mouseY < timeY+36){
      In_Da_Club();
      Verse_Chorus_Bridge();
      fill(125,70,29);
      textFont(font,20);
      text("2003",songX,songY);
      textFont(font,30);
      text("''In Da Club''",songX-12,songY+23);
      textFont(font,18);
      text("50 Cent",songX,songY+54);
    } if (mouseY > timeY+36 && mouseY < timeY+45){
      Yeah();
      Verse_Chorus_Bridge();
      fill(0,88,111);
      textFont(font,20);
      text("2004",songX,songY);
      textFont(font,30);
      text("''Yeah''",songX-12,songY+23);
      textFont(font,18);
      text("Usher feat. Lil Jon & Ludacris",songX,songY+54);
    } if (mouseY > timeY+45 && mouseY < timeY+54){
      We_Belong_Together();
      Verse_shortChorus();
      fill(207,66,51);
      textFont(font,20);
      text("2005",songX,songY);
      textFont(font,30);
      text("''We Belong Together''",songX-12,songY+23);
      textFont(font,18);
      text("Mariah Carey",songX,songY+54);
    } if (mouseY > timeY+54 && mouseY < timeY+63){
      Irreplaceable();
      Verse_Chorus_Bridge();
      fill(180,76,151);
      textFont(font,20);
      text("2006",songX,songY);
      textFont(font,30);
      text("''Irreplaceable''",songX-12,songY+23);
      textFont(font,18);
      text("Beyoncé",songX,songY+54);
    } if (mouseY > timeY+63 && mouseY < timeY+72){
      Umbrella();
      Verse_Chorus_Bridge();
      fill(217,120,58);
      textFont(font,20);
      text("2007",songX,songY);
      textFont(font,30);
      text("''Umbrella''",songX-12,songY+23);
      textFont(font,18);
      text("Rihanna feat. Jay-Z",songX,songY+54);
    } if (mouseY > timeY+72 && mouseY < timeY+81){
      Low();
      Verse_shortChorus();
      fill(134,134,32);
      textFont(font,20);
      text("2008",songX,songY);
      textFont(font,30);
      text("''Low''",songX-12,songY+23);
      textFont(font,18);
      text("Flo Rida feat. T-Pain",songX,songY+54);
    } if (mouseY > timeY+81 && mouseY < timeY+90){
      I_Gotta_Feeling();
      Verse_Chorus_Bridge();
      fill(17,146,183);
      textFont(font,20);
      text("2009",songX,songY);
      textFont(font,30);
      text("''I Gotta Feeling''",songX-12,songY+23);
      textFont(font,18);
      text("The Black Eyed Peas",songX,songY+54);
    } if (mouseY > timeY+90 && mouseY < timeY+99){
      Tik_Tok();
      Verse_Chorus_Bridge();
      fill(137,112,30);
      textFont(font,20);
      text("2010",songX,songY);
      textFont(font,30);
      text("''Tik Tok''",songX-12,songY+23);
      textFont(font,18);
      text("Kesha",songX,songY+54);
    } if (mouseY > timeY+99 && mouseY < timeY+108){
      We_Found_Love();
      Verse_Chorus_Bridge();
      fill(92,178,156);
      textFont(font,20);
      text("2011",songX,songY);
      textFont(font,30);
      text("''We Found Love''",songX-12,songY+23);
      textFont(font,18);
      text("Rihanna feat. Calvin Harris",songX,songY+54);
    } if (mouseY > timeY+108 && mouseY < timeY+117){
      Call_Me_Maybe();
      Verse_Chorus_Bridge();
      fill(17,146,183);
      textFont(font,20);
      text("2012",songX,songY);
      textFont(font,30);
      text("''Call Me Maybe''",songX-12,songY+23);
      textFont(font,18);
      text("Carly Rae Jepsen",songX,songY+54);
    }
  }
}


// LIST OF SONGS
// These functions map out the chord progressions for each individual song.

void At_the_Hop(){
  stroke(81,100,170);
  for (int i = x; i < 900; i += 400){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-420,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+120,y-420,circle,circle);
    ellipse(i+160,y-240,circle,circle);
    ellipse(i+180,y-180,circle,circle);
    ellipse(i+200,y-420,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-420);
    vertex(i+80,y-180);
    vertex(i+120,y-420);
    vertex(i+160,y-240);
    vertex(i+180,y-180);
    vertex(i+200,y-420);
    endShape();
  }
  ellipse(x+800,y-420,circle,circle);
  ellipse(x+840,y-320,circle,circle);
  ellipse(x+880,y-180,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-420);
  vertex(x+840,y-320);
  vertex(x+880,y-180);
  vertex(x+920,y-240);
  endShape();
}

void Mack_the_Knife(){
  stroke(180,76,151);
  for (int i = x; i < 1200; i += 160){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y-60,circle,circle);
    ellipse(i+80,y-240,circle,circle);
    ellipse(i+120,y,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y-60);
    vertex(i+80,y-240);
    vertex(i+120,y);
    endShape();
  }
  for (int i = x+120; i < 1200; i += 160){
    line(i,y,i+40,y);
  }
}

void Theme_from_A_Summer_Place(){
  stroke(140,189,79);
  for (int i = x; i < 900; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-320,circle,circle);
    ellipse(i+40,y-80,circle,circle);
    ellipse(i+60,y-240,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-320);
    vertex(i+40,y-80);
    vertex(i+60,y-240);
    endShape();
  }
  for (int i = x+60; i < 900; i += 80){
    line(i,y-240,i+20,y-420);
  }
  ellipse(x+800,y-320,circle,circle);
  ellipse(x+840,y-180,circle,circle);
  ellipse(x+880,y,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  ellipse(x+960,y,circle,circle);
  ellipse(x+1000,y-80,circle,circle);
  ellipse(x+1040,y-240,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-320);
  vertex(x+840,y-180);
  vertex(x+880,y);
  vertex(x+920,y-240);
  vertex(x+960,y);
  vertex(x+1000,y-80);
  vertex(x+1040,y-240);
  vertex(x+1080,y-240);
  endShape();
}

void Tossin_and_Turnin(){
  stroke(207,66,51);
  ellipse(x,y,circle,circle);
  ellipse(x+20,y-180,circle,circle);
  ellipse(x+40,y,circle, circle);
  ellipse(x+80,y,circle, circle);
  ellipse(x+100,y-180,circle,circle);
  ellipse(x+120,y,circle, circle);
  ellipse(x+160,y-240,circle,circle);
  ellipse(x+200,y-240,circle,circle);
  ellipse(x+240,y,circle,circle);
  ellipse(x+280,y-180,circle,circle);
  ellipse(x+320,y,circle,circle);
  ellipse(x+360,y-180,circle,circle);
  ellipse(x+400,y,circle,circle);
  ellipse(x+420,y-180,circle,circle);
  ellipse(x+440,y,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+20,y-180);
  vertex(x+40,y);
  vertex(x+80,y);
  vertex(x+100,y-180);
  vertex(x+120,y);
  vertex(x+160,y-240);
  vertex(x+200,y-240);
  vertex(x+240,y);
  vertex(x+280,y-180);
  vertex(x+320,y);
  vertex(x+360,y-180);
  vertex(x+400,y);
  vertex(x+420,y-180);
  vertex(x+440,y);
  endShape();
  ellipse(x+800,y-180,circle,circle);
  ellipse(x+840,y-180,circle,circle);
  ellipse(x+880,y,circle,circle);
  ellipse(x+920,y,circle,circle);
  ellipse(x+960,y-180,circle,circle);
  ellipse(x+1000,y-180,circle,circle);
  ellipse(x+1040,y-60,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  ellipse(x+1160,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-180);
  vertex(x+840,y-180);
  vertex(x+880,y);
  vertex(x+920,y);
  vertex(x+960,y-180);
  vertex(x+1000,y-180);
  vertex(x+1040,y-60);
  vertex(x+1080,y-240);
  vertex(x+1120,y-240);
  vertex(x+1160,y-240);
  endShape();
}

void Sherry(){
  stroke(207, 66, 51);
  for (int i = x; i < 900; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-320,circle,circle);
    ellipse(i+40,y-80,circle,circle);
    ellipse(i+60,y-240,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-320);
    vertex(i+40,y-80);
    vertex(i+60,y-240);
    endShape();
  }
  for (int i = x+60; i < 900; i += 80){
    line(i,y-240,i+20,y-420);
  }
  ellipse(x+800,y-120,circle,circle);
  ellipse(x+840,y-120,circle,circle);
  ellipse(x+880,y-300,circle,circle);
  ellipse(x+920,y-300,circle,circle);
  ellipse(x+960,y-60,circle,circle);
  ellipse(x+1000,y-60,circle,circle);
  ellipse(x+1040,y-240,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-120);
  vertex(x+840,y-120);
  vertex(x+880,y-300);
  vertex(x+920,y-300);
  vertex(x+960,y-60);
  vertex(x+1000,y-60);
  vertex(x+1040,y-240);
  vertex(x+1080,y-240);
  endShape();
}

void Sugar_Shack(){
  stroke(17,146,183);
  for (int i = x; i < 450; i += 40){
    ellipse(i,y,circle,circle);
    line(i,y,i+20,y-180);
    ellipse(i+20,y-180,circle,circle);
  }
  for (int i = x+20; i < 450; i += 40){
    line(i,y-180,i+20,y);
  }
  line(x+300,y-180,x+320,y-80);
  for (int i = x+320; i < 700; i += 80){
    ellipse(i,y-80,circle,circle);
    line(i,y-80,i+40,y-240);
    ellipse(i+40,y-240,circle,circle);
  }
  line(x+360,y-240,x+400,y-80);
  line(x+440,y-240,x+480,y-80);
  line(x+520,y-240,x+560,y);
  for (int i = x+560; i < 850; i += 40){
    ellipse(i,y,circle,circle);
    line(i,y,i+20,y-180);
    ellipse(i+20,y-180,circle,circle);
  }
  for (int i = x+580; i < 850; i += 40){
    line(i,y-180,i+20,y);
  }
}

void I_Want_to_Hold_Your_Hand(){
  stroke(17,146,183);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+80,y-320,circle,circle);
    ellipse(i+120,y-140,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-240);
    vertex(i+80,y-320);
    vertex(i+120,y-140);
    endShape();
  }
  line(x+120,y-140,x+160,y-420);
  ellipse(x+400,y-180,circle,circle);
  ellipse(x+420,y-240,circle,circle);
  ellipse(x+440,y-420,circle,circle);
  ellipse(x+460,y-320,circle,circle);
  ellipse(x+480,y-180,circle,circle);
  ellipse(x+500,y-240,circle,circle);
  ellipse(x+520,y-420,circle,circle);
  beginShape();
  vertex(x+400,y-180);
  vertex(x+420,y-240);
  vertex(x+440,y-420);
  vertex(x+460,y-320);
  vertex(x+480,y-180);
  vertex(x+500,y-240);
  vertex(x+520,y-420);
  endShape();
  ellipse(x+800,y-360,circle,circle);
  ellipse(x+840,y-420,circle,circle);
  ellipse(x+880,y-180,circle,circle);
  ellipse(x+920,y-80,circle,circle);
  ellipse(x+960,y-360,circle,circle);
  ellipse(x+1000,y-420,circle,circle);
  ellipse(x+1040,y-180,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  ellipse(x+1160,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-360);
  vertex(x+840,y-420);
  vertex(x+880,y-180);
  vertex(x+920,y-80);
  vertex(x+960,y-360);
  vertex(x+1000,y-420);
  vertex(x+1040,y-180);
  vertex(x+1080,y-240);
  vertex(x+1120,y-240);
  vertex(x+1160,y-240);
  endShape();
}

void I_Cant_Get_No_Satisfaction(){
  stroke(186,209,71);
  for (int i = x; i < 500; i += 80){
    ellipse(i,y,circle,circle);
    line(i,y,i+40,y-180);
    ellipse(i+40,y-180,circle,circle);
  }
  for (int i = x+40; i < 500; i += 80){
    line(i,y-180,i+40,y);
  }
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y);
    vertex(i+80,y-180);
    vertex(i+120,y-180);
    endShape();
  }
  line(x+520,y-180,x+560,y);
}

void Im_a_Believer(){
  stroke(17,146,183);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+80,y-420,circle,circle);
    ellipse(i+120,y-420,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-240);
    vertex(i+80,y-420);
    vertex(i+120,y-420);
    endShape();
  }
  line(x+120,y-420,x+160,y-420);
  for (int i = x+320; i < 700; i += 80){
    ellipse(i,y-180,circle,circle);
    ellipse(i+40,y-420,circle,circle);
    beginShape();
    vertex(i-40,y-420);
    vertex(i,y-180);
    vertex(i+40,y-420);
    endShape();
  }
  ellipse(x+560,y-240,circle,circle);
  ellipse(x+600,y-240,circle,circle);
  beginShape();
  vertex(x+520,y-420);
  vertex(x+560,y-240);
  vertex(x+600,y-240);
  endShape();
  for (int i = x+640; i < 1100; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-180,circle,circle);
    ellipse(i+40,y-420,circle,circle);
    beginShape();
    vertex(i, y-420);
    vertex(i+20,y-180);
    vertex(i+40,y-420);
    vertex(i+80,y-420);
    endShape();
  }
  ellipse(x+960,y-420,circle,circle);
  ellipse(x+1000,y-180,circle,circle);
  ellipse(x+1040,y-420,circle,circle);
  ellipse(x+1080,y-360,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  ellipse(x+1160,y-240,circle,circle);
  beginShape();
  vertex(x+960,y-420);
  vertex(x+1000,y-180);
  vertex(x+1040,y-420);
  vertex(x+1080,y-360);
  vertex(x+1120,y-240);
  vertex(x+1160,y-240);
  endShape();
}

void To_Sir_With_Love(){
  stroke(149,75,151);
  for (int i = x; i < 500; i += 240){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+80,y-60,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+160,y,circle,circle);
    ellipse(i+200,y,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y);
    vertex(i+80,y-60);
    vertex(i+120,y-180);
    vertex(i+160,y);
    vertex(i+200,y);
    endShape();
  }
  line(x+200,y,x+240,y);
  ellipse(x+480,y-360,circle,circle);
  ellipse(x+520,y-140,circle,circle);
  ellipse(x+560,y-360,circle,circle);
  ellipse(x+600,y-140,circle,circle);
  ellipse(x+640,y-60,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  ellipse(x+720,y-60,circle,circle);
  ellipse(x+760,y-300,circle,circle);
  beginShape();
  vertex(x+440,y);
  vertex(x+480,y-360);
  vertex(x+520,y-140);
  vertex(x+560,y-360);
  vertex(x+600,y-140);
  vertex(x+640,y-60);
  vertex(x+680,y-240);
  vertex(x+720,y-60);
  vertex(x+760,y-300);
  endShape();
  stroke(211,103,162);
  ellipse(x+800,y-420,circle,circle);
  ellipse(x+840,y-360,circle,circle);
  ellipse(x+880,y-420,circle,circle);
  ellipse(x+920,y-360,circle,circle);
  ellipse(x+960,y-420,circle,circle);
  ellipse(x+1000,y-180,circle,circle);
  ellipse(x+1040,y-240,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-420);
  vertex(x+840,y-360);
  vertex(x+880,y-420);
  vertex(x+920,y-360);
  vertex(x+960,y-420);
  vertex(x+1000,y-180);
  vertex(x+1040,y-240);
  vertex(x+1080,y-240);
  endShape();
}

void Hey_Jude(){
  stroke(140,189,79);
  ellipse(x,y-420,circle,circle);
  ellipse(x+40,y-240,circle,circle);
  ellipse(x+80,y-240,circle,circle);
  ellipse(x+120,y-420,circle,circle);
  ellipse(x+160,y-180,circle,circle);
  ellipse(x+200,y-420,circle,circle);
  ellipse(x+240,y-240,circle,circle);
  ellipse(x+280,y-420,circle,circle);
  beginShape();
  vertex(x,y-420);
  vertex(x+40,y-240);
  vertex(x+80,y-240);
  vertex(x+120,y-420);
  vertex(x+160,y-180);
  vertex(x+200,y-420);
  vertex(x+240,y-240);
  vertex(x+280,y-420);
  endShape();
  for (int i = x+400; i < 900; i += 200) {
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-180,circle,circle);
    ellipse(i+60,y-320,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+100,y-320,circle,circle);
    ellipse(i+120,y-240,circle,circle);
    ellipse(i+160,y-420,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-180);
    vertex(i+60,y-320);
    vertex(i+80,y-80);
    vertex(i+100,y-320);
    vertex(i+120,y-240);
    vertex(i+160,y-420);
    endShape();
  }
  line(x+560, y-420, x+600, y-420);
  for (int i = x+800; i < 1200; i += 160) {
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+120,y-420,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-360);
    vertex(i+80,y-180);
    vertex(i+120,y-420);
    endShape();
  }
  line(x+920,y-420,x+960,y-420);
}

void In_the_Year_2525_Exordium_and_Terminus(){
  stroke(47,57,103);
  for (int i = x; i < 1100; i += 320){
    ellipse(i,y-440,circle,circle);
    ellipse(i+40,y-440,circle,circle);
    ellipse(i+80,y-360,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    ellipse(i+160,y-300,circle,circle);
    ellipse(i+200,y-300,circle,circle);
    ellipse(i+240,y-240,circle,circle);
    ellipse(i+280,y-240,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+40,y-440);
    vertex(i+80,y-360);
    vertex(i+120,y-360);
    vertex(i+160,y-300);
    vertex(i+200,y-300);
    vertex(i+240,y-240);
    vertex(i+280,y-240);
    endShape();
  }
  line(x+280,y-240,x+320,y-440);
  line(x+600,y-240,x+640,y-440);
}

void Bridge_Over_Troubled_Water(){
  stroke(235,231,56);
  ellipse(x,y,circle,circle);
  ellipse(x+40,y-180,circle,circle);
  ellipse(x+80,y,circle,circle);
  ellipse(x+120,y-180,circle,circle);
  ellipse(x+160,y,circle,circle);
  ellipse(x+200,y-80,circle,circle);
  ellipse(x+240,y,circle,circle);
  ellipse(x+260,y-180,circle,circle);
  ellipse(x+280,y,circle,circle);
  ellipse(x+300,y-180,circle,circle);
  ellipse(x+320,y,circle,circle);
  ellipse(x+360,y-240,circle,circle);
  ellipse(x+400,y-240,circle,circle);
  ellipse(x+440,y,circle,circle);
  ellipse(x+480,y,circle,circle);
  ellipse(x+520,y-180,circle,circle);
  ellipse(x+540,y-60,circle,circle);
  ellipse(x+560,y-240,circle,circle);
  ellipse(x+580,y,circle,circle);
  ellipse(x+600,y-180,circle,circle);
  ellipse(x+640,y-240,circle,circle);
  ellipse(x+660,y-320,circle,circle);
  ellipse(x+680,y-180,circle,circle);
  ellipse(x+700,y-120,circle,circle);
  ellipse(x+720,y-320,circle,circle);
  ellipse(x+740,y,circle,circle);
  ellipse(x+760,y-180,circle,circle);
  ellipse(x+800,y-240,circle,circle);
  ellipse(x+820,y-320,circle,circle);
  ellipse(x+840,y-180,circle,circle);
  ellipse(x+860,y-120,circle,circle);
  ellipse(x+880,y,circle,circle);
  ellipse(x+880,y-320,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+40,y-180);
  vertex(x+80,y);
  vertex(x+120,y-180);
  vertex(x+160,y);
  vertex(x+200,y-80);
  vertex(x+240,y);
  vertex(x+260,y-180);
  vertex(x+280,y);
  vertex(x+300,y-180);
  vertex(x+320,y);
  vertex(x+360,y-240);
  vertex(x+400,y-240);
  vertex(x+440,y);
  vertex(x+480,y);
  vertex(x+520,y-180);
  vertex(x+540,y-60);
  vertex(x+560,y-240);
  vertex(x+580,y);
  vertex(x+600,y-180);
  vertex(x+640,y-240);
  vertex(x+660,y-320);
  vertex(x+680,y-180);
  vertex(x+700,y-120);
  vertex(x+720,y-320);
  vertex(x+740,y);
  vertex(x+760,y-180);
  vertex(x+800,y-240);
  vertex(x+820,y-320);
  vertex(x+840,y-180);
  vertex(x+860,y-120);
  vertex(x+880,y);
  vertex(x+880,y-320);
  endShape();
}

void Joy_to_the_World(){
  stroke(238,192,57);
  for (int i = x; i < 350; i += 40){
    ellipse(i,y-420,circle,circle);
  }
  ellipse(x+180,y-360,circle,circle);
  ellipse(x+200,y-320,circle,circle);
  ellipse(x+220,y-300,circle,circle);
  ellipse(x+240,y-240,circle,circle);
  ellipse(x+280,y-420,circle,circle);
  ellipse(x+320,y-180,circle,circle);
  ellipse(x+340,y-240,circle,circle);
  ellipse(x+360,y-420,circle,circle);
  beginShape();
  vertex(x,y-420);
  vertex(x+160,y-420);
  vertex(x+180,y-360);
  vertex(x+200,y-320);
  vertex(x+220,y-300);
  vertex(x+240,y-240);
  vertex(x+280,y-420);
  vertex(x+320,y-180);
  vertex(x+340,y-240);
  vertex(x+360,y-420);
  endShape();
  ellipse(x+400,y-420,circle,circle);
  ellipse(x+440,y-420,circle,circle);
  ellipse(x+480,y-240,circle,circle);
  ellipse(x+520,y-420,circle,circle);
  ellipse(x+560,y-420,circle,circle);
  ellipse(x+580,y-360,circle,circle);
  ellipse(x+600,y-320,circle,circle);
  ellipse(x+620,y-300,circle,circle);
  ellipse(x+640,y-240,circle,circle);
  ellipse(x+680,y-420,circle,circle);
  beginShape();
  vertex(x+400,y-420);
  vertex(x+440,y-420);
  vertex(x+480,y-240);
  vertex(x+520,y-420);
  vertex(x+560,y-420);
  vertex(x+580,y-360);
  vertex(x+600,y-320);
  vertex(x+620,y-300);
  vertex(x+640,y-240);
  vertex(x+680,y-420);
  endShape();
  stroke(186,209,71);
  for (int i = x+800; i < 1250; i += 80){
    ellipse(i,y-420,circle,circle);
    line(i,y-420,i+40,y-180);
    ellipse(i+40,y-180,circle,circle);
  }
  for (int i = x+840; i < 1200; i += 80){
    line(i,y-180,i+40,y-420);
  }
}

void The_First_Time_Ever_I_Saw_Your_Face(){
  stroke(207,66,51);
  ellipse(x,y-80,circle,circle);
  ellipse(x+40,y-240,circle,circle);
  ellipse(x+80,y-420,circle,circle);
  ellipse(x+120,y-420,circle,circle);
  ellipse(x+160,y-320,circle,circle);
  ellipse(x+200,y-320,circle,circle);
  ellipse(x+240,y-140,circle,circle);
  ellipse(x+280,y-180,circle,circle);
  ellipse(x+320,y-180,circle,circle);
  ellipse(x+360,y-240,circle,circle);
  ellipse(x+400,y-240,circle,circle);
  ellipse(x+440,y-420,circle,circle);
  ellipse(x+480,y-420,circle,circle);
  ellipse(x+520,y-360,circle,circle);
  ellipse(x+560,y-360,circle,circle);
  ellipse(x+600,y-420,circle,circle);
  ellipse(x+640,y-420,circle,circle);
  beginShape();
  vertex(x,y-80);
  vertex(x+40,y-240);
  vertex(x+80,y-420);
  vertex(x+120,y-420);
  vertex(x+160,y-320);
  vertex(x+200,y-320);
  vertex(x+240,y-140);
  vertex(x+280,y-180);
  vertex(x+320,y-180);
  vertex(x+360,y-240);
  vertex(x+400,y-240);
  vertex(x+440,y-420);
  vertex(x+480,y-420);
  vertex(x+520,y-360);
  vertex(x+560,y-360);
  vertex(x+600,y-420);
  vertex(x+640,y-420);
  endShape();
  ellipse(x+800,y-80,circle,circle);
  ellipse(x+840,y-80,circle,circle);
  ellipse(x+880,y-240,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  ellipse(x+960,y-420,circle,circle);
  ellipse(x+1000,y-360,circle,circle);
  ellipse(x+1040,y-420,circle,circle);
  ellipse(x+1080,y-360,circle,circle);
  ellipse(x+1120,y-420,circle,circle);
  beginShape();
  vertex(x+800,y-80);
  vertex(x+840,y-80);
  vertex(x+880,y-240);
  vertex(x+920,y-240);
  vertex(x+960,y-420);
  vertex(x+1000,y-360);
  vertex(x+1040,y-420);
  vertex(x+1080,y-360);
  vertex(x+1120,y-420);
  endShape();
}

void My_Love(){
  stroke(140,189,79);
  ellipse(x,y-180,circle,circle);
  ellipse(x+40,y-180,circle,circle);
  ellipse(x+80,y-140,circle,circle);
  ellipse(x+120,y-300,circle,circle);
  ellipse(x+160,y,circle,circle);
  ellipse(x+200,y-140,circle,circle);
  ellipse(x+220,y-180,circle,circle);
  ellipse(x+240,y-200,circle,circle);
  ellipse(x+280,y,circle,circle);
  ellipse(x+320,y-80,circle,circle);
  ellipse(x+360,y-180,circle,circle);
  ellipse(x+400,y,circle,circle);
  beginShape();
  vertex(x,y-180);
  vertex(x+40,y-180);
  vertex(x+80,y-140);
  vertex(x+120,y-300);
  vertex(x+160,y);
  vertex(x+200,y-140);
  vertex(x+220,y-180);
  vertex(x+240,y-200);
  vertex(x+280,y);
  vertex(x+320,y-80);
  vertex(x+360,y-180);
  vertex(x+400,y);
  endShape();
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-80,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+60,y-120,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+100,y-240,circle,circle);
    ellipse(i+120,y,circle,circle);
    beginShape();
    vertex(i,y-80);
    vertex(i+20,y-240);
    vertex(i+40,y);
    vertex(i+60,y-120);
    vertex(i+80,y-180);
    vertex(i+100,y-240);
    vertex(i+120,y);
    endShape();
  }
  ellipse(x+940,y-120,circle,circle);
  beginShape();
  vertex(x+920,y);
  vertex(x+940,y-120);
  vertex(x+960,y-80);
  endShape();
}

void Seasons_in_the_Sun(){
  stroke(92,178,156);
  ellipse(x,y,circle,circle);
  ellipse(x+40,y,circle,circle);
  ellipse(x+80,y-80,circle,circle);
  ellipse(x+120,y-80,circle,circle);
  ellipse(x+160,y,circle,circle);
  ellipse(x+200,y,circle,circle);
  ellipse(x+240,y-80,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  ellipse(x+320,y,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+40);
  vertex(x+80,y-80);
  vertex(x+120,y-80);
  vertex(x+160,y);
  vertex(x+200,y);
  vertex(x+240,y-80);
  vertex(x+280,y-240);
  vertex(x+320,y);
  endShape();
  ellipse(x+400,y,circle,circle);
  ellipse(x+440,y-80,circle,circle);
  ellipse(x+480,y-240,circle,circle);
  ellipse(x+520,y-240,circle,circle);
  ellipse(x+540,y,circle,circle);
  beginShape();
  vertex(x+400,y);
  vertex(x+440,y-80);
  vertex(x+480,y-240);
  vertex(x+520,y-240);
  vertex(x+540,y);
  endShape();
}

void Love_Will_Keep_Us_Together(){
  stroke(211,103,162);
  ellipse(x,y-420,circle,circle);
  ellipse(x+40,y-420,circle,circle);
  ellipse(x+80,y-360,circle,circle);
  ellipse(x+120,y-360,circle,circle);
  ellipse(x+160,y-300,circle,circle);
  ellipse(x+200,y-300,circle,circle);
  for (int i = x+240; i < 550; i += 40){
    ellipse(i,y-180,circle,circle);
  }
  beginShape();
  vertex(x,y-420);
  vertex(x+40,y-420);
  vertex(x+80,y-360);
  vertex(x+120,y-360);
  vertex(x+160,y-300);
  vertex(x+200,y-300);
  vertex(x+240,y-180);
  vertex(x+360,y-180);
  endShape();
  for (int i = x+400; i < 700; i += 40){
    ellipse(i,y-420,circle,circle);
  }
  ellipse(x+560,y-240,circle,circle);
  ellipse(x+580,y-180,circle,circle);
  ellipse(x+600,y-240,circle,circle);
  ellipse(x+640,y-420,circle,circle);
  ellipse(x+680,y-420,circle,circle);
  beginShape();
  vertex(x+400,y-420);
  vertex(x+520,y-420);
  vertex(x+560,y-240);
  vertex(x+580,y-180);
  vertex(x+600,y-240);
  vertex(x+640,y-420);
  vertex(x+680,y-420);
  endShape();
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-120,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+60,y-180,circle,circle);
    ellipse(i+80,y-300,circle,circle);
    beginShape();
    vertex(i,y-120);
    vertex(i+40,y-360);
    vertex(i+60,y-180);
    vertex(i+80,y-300);
    endShape();
  }
  ellipse(x+920,y-420,circle,circle);
  beginShape();
  vertex(x+880,y-300);
  vertex(x+920,y-420);
  vertex(x+960,y-120);
  endShape();
  ellipse(x+1080,y-240,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  beginShape();
  vertex(x+1040,y-300);
  vertex(x+1080,y-240);
  vertex(x+1120,y-240);
  endShape();
}

void Tonights_the_Night_Gonna_Be_Alright(){
  stroke(211,103,162);
  for (int i = x; i < 450; i += 80){
    ellipse(i,y,circle,circle);
    line(i,y,i+40,y-180);
    ellipse(i+40,y-180,circle,circle);
  }
  for (int i = x+40; i < 400; i += 80){
    line(i,y-180,i+40,y);
  }
  ellipse(x+400,y,circle,circle);
  ellipse(x+440,y-180,circle,circle);
  ellipse(x+480,y,circle,circle);
  ellipse(x+520,y-320,circle,circle);
  ellipse(x+560,y-80,circle,circle);
  ellipse(x+600,y-180,circle,circle);
  ellipse(x+640,y,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  beginShape();
  vertex(x+400,y);
  vertex(x+440,y-180);
  vertex(x+480,y);
  vertex(x+520,y-320);
  vertex(x+560,y-80);
  vertex(x+600,y-180);
  vertex(x+640,y);
  vertex(x+680,y-240);
  endShape();
}

void You_Light_Up_My_Life(){
  stroke(238,192,57);
  ellipse(x,y-260,circle,circle);
  ellipse(x+40,y,circle,circle);
  ellipse(x+80,y-180,circle,circle);
  ellipse(x+120,y-80,circle,circle);
  ellipse(x+160,y-140,circle,circle);
  ellipse(x+200,y-300,circle,circle);
  ellipse(x+240,y-80,circle,circle);
  ellipse(x+280,y-60,circle,circle);
  beginShape();
  vertex(x,y-260);
  vertex(x+40,y);
  vertex(x+80,y-180);
  vertex(x+120,y-80);
  vertex(x+160,y-140);
  vertex(x+200,y-300);
  vertex(x+240,y-80);
  vertex(x+280,y-60);
  endShape();
  ellipse(x+160,y-120,circle,circle);
  ellipse(x+200,y-120,circle,circle);
  ellipse(x+240,y-240,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  beginShape();
  vertex(x+120,y-80);
  vertex(x+160,y-120);
  vertex(x+200,y-120);
  vertex(x+240,y-240);
  vertex(x+280,y-240);
  endShape();
  for (int i = x+400; i < 700; i += 40){
    ellipse(i,y,circle,circle);
  }
  ellipse(x+560,y-300,circle,circle);
  ellipse(x+600,y-300,circle,circle);
  ellipse(x+640,y-80,circle,circle);
  ellipse(x+680,y-80,circle,circle);
  ellipse(x+720,y-240,circle,circle);
  ellipse(x+760,y-240,circle,circle);
  ellipse(x+800,y,circle,circle);
  ellipse(x+840,y-320,circle,circle);
  ellipse(x+880,y-80,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  beginShape();
  vertex(x+400,y);
  vertex(x+520,y);
  vertex(x+560,y-300);
  vertex(x+600,y-300);
  vertex(x+640,y-80);
  vertex(x+680,y-80);
  vertex(x+720,y-240);
  vertex(x+760,y-240);
  vertex(x+800,y);
  vertex(x+840,y-320);
  vertex(x+880,y-80);
  vertex(x+920,y-240);
  endShape();
}

void Night_Fever(){
  stroke(211,103,162);
  ellipse(x,y-420,circle,circle);
  ellipse(x+40,y-360,circle,circle);
  ellipse(x+80,y-180,circle,circle);
  ellipse(x+120,y-420,circle,circle);
  ellipse(x+160,y-420,circle,circle);
  ellipse(x+200,y-80,circle,circle);
  ellipse(x+240,y-180,circle,circle);
  ellipse(x+260,y-360,circle,circle);
  beginShape();
  vertex(x,y-420);
  vertex(x+40,y-360);
  vertex(x+80,y-180);
  vertex(x+120,y-420);
  vertex(x+160,y-420);
  vertex(x+200,y-80);
  vertex(x+240,y-180);
  vertex(x+260,y-360);
  endShape();
  stroke(186,209,71);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-320,circle,circle);
    ellipse(i+40,y-80,circle,circle);
    ellipse(i+80,y,circle,circle);
    ellipse(i+120,y-80,circle,circle);
    beginShape();
    vertex(i,y-320);
    vertex(i+40,y-80);
    vertex(i+80,y);
    vertex(i+120,y-80);
    endShape();
  }
  line(x+520,y-80,x+560,y-320);
  stroke(92,178,156);
  for (int i = x+800; i < 1100; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-360);
    vertex(i+80,y-420);
    endShape();
  }
  for (int i = x+960; i < 1200; i += 40){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-360,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-360);
    vertex(i+40,y-420);
    endShape();
  }
  ellipse(x+1040,y-420,circle,circle);
  line(x+1040,y-420,x+1080,y-240);
  ellipse(x+1080,y-240,circle,circle);
}

void My_Sharona(){
  stroke(0,88,111);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-20,circle,circle);
    ellipse(i+40,y-20,circle,circle);
    ellipse(i+80,y-20,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+140,y-120,circle,circle);
    beginShape();
    vertex(i,y-20);
    vertex(i+40,y-20);
    vertex(i+80,y-20);
    vertex(i+120,y-180);
    vertex(i+140,y-120);
    vertex(i+160,y-20);
    endShape();
  }
  ellipse(x+320,y-20,circle,circle);
  ellipse(x+360,y-20,circle,circle);
  ellipse(x+400,y-120,circle,circle);
  ellipse(x+440,y-120,circle,circle);
  ellipse(x+480,y-180,circle,circle);
  ellipse(x+520,y-300,circle,circle);
  ellipse(x+540,y-360,circle,circle);
  beginShape();
  vertex(x+320,y-20);
  vertex(x+360,y-20);
  vertex(x+400,y-120);
  vertex(x+440,y-120);
  vertex(x+480,y-180);
  vertex(x+520,y-300);
  vertex(x+540,y-360);
  endShape();
    for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-20,circle,circle);
    ellipse(i+40,y-20,circle,circle);
    ellipse(i+80,y-20,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+140,y-120,circle,circle);
    beginShape();
    vertex(i,y-20);
    vertex(i+40,y-20);
    vertex(i+80,y-20);
    vertex(i+120,y-180);
    vertex(i+140,y-120);
    endShape();
  }
  line(x+940,y-120,x+960,y-20);
}

void Call_Me(){
  stroke(137,112,30);
  ellipse(x,y-440,circle,circle);
  ellipse(x+40,y-440,circle,circle);
  ellipse(x+80,y-300,circle,circle);
  ellipse(x+120,y-300,circle,circle);
  ellipse(x+160,y-200,circle,circle);
  ellipse(x+200,y-240,circle,circle);
  ellipse(x+240,y-200,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  beginShape();
  vertex(x,y-440);
  vertex(x+40,y-440);
  vertex(x+80,y-300);
  vertex(x+120,y-300);
  vertex(x+160,y-200);
  vertex(x+200,y-240);
  vertex(x+240,y-200);
  vertex(x+280,y-240);
  endShape();
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-20,circle,circle);
    ellipse(i+40,y-120,circle,circle);
    ellipse(i+80,y-200,circle,circle);
    ellipse(i+120,y-300,circle,circle);
    beginShape();
    vertex(i,y-20);
    vertex(i+40,y-120);
    vertex(i+80,y-200);
    vertex(i+120,y-300);
    endShape();
  }
  line(x+520,y-300,x+560,y-20);
  ellipse(x+800,y-80,circle,circle);
  ellipse(x+840,y-80,circle,circle);
  ellipse(x+880,y-300,circle,circle);
  ellipse(x+920,y-300,circle,circle);
  ellipse(x+960,y-140,circle,circle);
  ellipse(x+1000,y-140,circle,circle);
  ellipse(x+1040,y-360,circle,circle);
  ellipse(x+1080,y-360,circle,circle);
  beginShape();
  vertex(x+800,y-80);
  vertex(x+840,y-80);
  vertex(x+880,y-300);
  vertex(x+920,y-300);
  vertex(x+960,y-140);
  vertex(x+1000,y-140);
  vertex(x+1040,y-360);
  vertex(x+1080,y-360);
  endShape();
}

void Physical(){
  stroke(106,122,40);
  for (int i = x; i < 400; i += 80){
    ellipse(i,y-200,circle,circle);
    line(i,y-200,i+20,y-300);
    ellipse(i+20,y-300,circle,circle);
    line(i+20,y-300,i+40,y-360);
    ellipse(i+40,y-360,circle,circle);
  }
  line(x+40,y-360,x+80,y-200);
  line(x+120,y-360,x+160,y-200);
  ellipse(x+220,y-240,circle,circle);
  ellipse(x+240,y-440,circle,circle);
  ellipse(x+280,y-440,circle,circle);
  beginShape();
  vertex(x+200,y-360);
  vertex(x+220,y-240);
  vertex(x+240,y-440);
  vertex(x+280,y-440);
  endShape();
  for (int i = x+400; i < 700; i += 40){
    ellipse(i,y-300,circle,circle);
  }
  for (int i = x+560; i < 850; i += 40){
    ellipse(i,y-440,circle,circle);
  }
  beginShape();
  vertex(x+400,y-300);
  vertex(x+520,y-300);
  vertex(x+560,y-440);
  vertex(x+680,y-440);
  endShape();
}

void I_Love_Rock_n_Roll(){
  stroke(106,122,40);
  ellipse(x,y-20,circle,circle);
  ellipse(x+40,y-20,circle,circle);
  ellipse(x+80,y-20,circle,circle);
  ellipse(x+120,y-260,circle,circle);
  ellipse(x+160,y-200,circle,circle);
  ellipse(x+180,y-260,circle,circle);
  ellipse(x+200,y-20,circle,circle);
  ellipse(x+240,y-200,circle,circle);
  ellipse(x+280,y-200,circle,circle);
  ellipse(x+320,y-260,circle,circle);
  beginShape();
  vertex(x,y-20);
  vertex(x+80,y-20);
  vertex(x+120,y-260);
  vertex(x+160,y-200);
  vertex(x+180,y-260);
  vertex(x+200,y-20);
  vertex(x+240,y-200);
  vertex(x+280,y-200);
  vertex(x+320,y-260);
  endShape();
  for (int i = x+400; i < 700; i += 80){
    ellipse(i,y-20,circle,circle);
    ellipse(i+40,y-200,circle,circle);
    ellipse(i+60,y-260,circle,circle);
    beginShape();
    vertex(i,y-20);
    vertex(i+40,y-200);
    vertex(i+60,y-260);
    vertex(i+80,y-20);
    endShape();
  }
  ellipse(x+560,y-20,circle,circle);
}

void Every_Breath_You_Take(){
  stroke(81,100,170);
  ellipse(x,y-420,circle,circle);
  ellipse(x+40,y-420,circle,circle);
  ellipse(x+80,y-320,circle,circle);
  ellipse(x+120,y-320,circle,circle);
  ellipse(x+160,y-180,circle,circle);
  ellipse(x+200,y-240,circle,circle);
  ellipse(x+240,y-320,circle,circle);
  ellipse(x+280,y-320,circle,circle);
  beginShape();
  vertex(x,y-420);
  vertex(x+40,y-420);
  vertex(x+80,y-320);
  vertex(x+120,y-320);
  vertex(x+160,y-180);
  vertex(x+200,y-240);
  vertex(x+240,y-320);
  vertex(x+280,y-320);
  endShape();
  ellipse(x+400,y-180,circle,circle);
  ellipse(x+440,y-180,circle,circle);
  ellipse(x+480,y-420,circle,circle);
  ellipse(x+520,y-420,circle,circle);
  ellipse(x+560,y-60,circle,circle);
  ellipse(x+600,y-60,circle,circle);
  ellipse(x+640,y-240,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  beginShape();
  vertex(x+400,y-180);
  vertex(x+440,y-180);
  vertex(x+480,y-420);
  vertex(x+520,y-420);
  vertex(x+560,y-60);
  vertex(x+600,y-60);
  vertex(x+640,y-240);
  vertex(x+680,y-240);
  endShape();
  for (int i = x+800; i < 1300; i += 160){
    ellipse(i,y-300,circle,circle);
    line(i,y-300,i+40,y-300);
    ellipse(i+40,y-300,circle,circle);
  }
  for (int i = x+880; i < 1300; i += 160){
    ellipse(i,y-360,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    beginShape();
    vertex(i-40,y-300);
    vertex(i,y-360);
    vertex(i+40,y-360);
    vertex(i+80,y-300);
    endShape();
  }
}

void Like_a_Virgin(){
  stroke(92,178,156);
  for (int i = x; i < 700; i += 400){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+80,y,circle,circle);
    ellipse(i+120,y,circle,circle);
    ellipse(i+160,y-80,circle,circle);
    ellipse(i+200,y-80,circle,circle);
    ellipse(i+240,y,circle,circle);
    ellipse(i+280,y,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+120,y);
    vertex(i+160,y-80);
    vertex(i+200,y-80);
    vertex(i+240,y);
    vertex(i+280,y);
    endShape();
  }
  ellipse(x+200,y-320,circle,circle);
  ellipse(x+240,y-80,circle,circle);
  ellipse(x+280,y-320,circle,circle);
  ellipse(x+320,y-240,circle,circle);
  ellipse(x+360,y-240,circle,circle);
  beginShape();
  vertex(x+160,y-80);
  vertex(x+200,y-320);
  vertex(x+240,y-80);
  vertex(x+280,y-320);
  vertex(x+320,y-240);
  vertex(x+360,y-240);
  endShape();
  for (int i = x+800; i < 1250; i += 80){
    ellipse(i,y-320,circle,circle);
    ellipse(i+40,y-60,circle,circle);
    line(i,y-320,i+40,y-60);
  }
  for (int i = x+800; i < 1200; i += 80){
    line(i+40,y-60,i+80,y-320);
  }
}

void Say_You_Say_Me(){
  stroke(81,100,170);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y-320,circle,circle);
    ellipse(i+60,y,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-240);
    vertex(i+40,y-320);
    vertex(i+60,y);
    vertex(i+80,y-80);
    vertex(i+120,y-360);
    endShape();
  }
  ellipse(x+140,y-240,circle,circle);
  beginShape();
  vertex(x+120,y-360);
  vertex(x+140,y-240);
  vertex(x+160,y-420);
  endShape();
  ellipse(x+320,y-240,circle,circle);
  line(x+280,y-360,x+320,y-240);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y-320,circle,circle);
    ellipse(i+60,y,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+100,y-240,circle,circle);
    ellipse(i+120,y-420,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-240);
    vertex(i+40,y-320);
    vertex(i+60,y);
    vertex(i+80,y-180);
    vertex(i+100,y-240);
    vertex(i+120,y-420);
    endShape();
  }
  line(x+520,y-420,x+560,y-420);
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-120,circle,circle);
    ellipse(i+20,y-360,circle,circle);
    ellipse(i+40,y-180,circle,circle);
    ellipse(i+60,y-420,circle,circle);
    beginShape();
    vertex(i,y-120);
    vertex(i+20,y-360);
    vertex(i+40,y-180);
    vertex(i+60,y-420);
    vertex(i+80,y-120);
    endShape();
  }
  ellipse(x+880,y-120,circle,circle);
  ellipse(x+900,y-360,circle,circle);
  ellipse(x+920,y-60,circle,circle);
  ellipse(x+940,y-260,circle,circle);
  beginShape();
  vertex(x+880,y-120);
  vertex(x+900,y-360);
  vertex(x+920,y-60);
  vertex(x+940,y-260);
  vertex(x+960,y-120);
  endShape();
  ellipse(x+1040,y-120,circle,circle);
  ellipse(x+1080,y-180,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  beginShape();
  vertex(x+1040,y-120);
  vertex(x+1120,y-240);
  endShape();
}

void Walk_Like_an_Egyptian(){
  stroke(211,103,162);
  for (int i = x; i < 450; i += 40){
    ellipse(i,y,circle,circle);
  }
  for (int i = x+320; i < 620; i += 40){
    ellipse(i,y-180,circle,circle);
  }
  ellipse(x+480,y,circle,circle);
  ellipse(x+520,y,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+280,y);
  vertex(x+320,y-180);
  vertex(x+440,y-180);
  vertex(x+480,y);
  vertex(x+520,y);
  endShape();
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-120,circle,circle);
    ellipse(i+40,y-120,circle,circle);
    ellipse(i+80,y,circle,circle);
    ellipse(i+120,y,circle,circle);
    beginShape();
    vertex(i,y-120);
    vertex(i+40,y-120);
    vertex(i+80,y);
    vertex(i+120,y);
    endShape();
  }
  line(x+920,y,x+960,y-120);
}

void Livin_on_a_Prayer(){
  stroke(106,122,40);
  ellipse(x,y-440,circle,circle);
  ellipse(x+40,y-440,circle,circle);
  ellipse(x+80,y-440,circle,circle);
  ellipse(x+120,y-440,circle,circle);
  ellipse(x+160,y-300,circle,circle);
  ellipse(x+200,y-360,circle,circle);
  ellipse(x+240,y-440,circle,circle);
  ellipse(x+280,y-440,circle,circle);
  beginShape();
  vertex(x,y-440);
  vertex(x+120,y-440);
  vertex(x+160,y-300);
  vertex(x+200,y-360);
  vertex(x+240,y-440);
  vertex(x+280,y-440);
  endShape();
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-440,circle,circle);
    ellipse(i+20,y-300,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+80,y-120,circle,circle);
    ellipse(i+100,y-300,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+20,y-300);
    vertex(i+40,y-360);
    vertex(i+80,y-120);
    vertex(i+100,y-300);
    vertex(i+120,y-360);
    endShape();
  }
  line(x+520,y-360,x+560,y-440);
  for (int i = x+800; i < 1200; i += 80){
    ellipse(i,y-300,circle,circle);
    ellipse(i+20,y-360,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+60,y-440,circle,circle);
    beginShape();
    vertex(i,y-300);
    vertex(i+20,y-360);
    vertex(i+40,y-360);
    vertex(i+60,y-440);
    vertex(i+80,y-300);
    endShape();
  }
  ellipse(x+1040,y-300,circle,circle);
  ellipse(x+1080,y-360,circle,circle);
  line(x+1040,y-300,x+1080,y-360);
}

void Roll_With_It(){
  stroke(17,146,183);
  for (int i = x; i < 450; i += 40){
    ellipse(i,y,circle,circle);
  }
  for (int i = x+320; i < 620; i += 40){
    ellipse(i,y-180,circle,circle);
  }
  for (int i = x+480; i < 800; i += 40){
    ellipse(i,y,circle,circle);
  }
  ellipse(x+640,y-240,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  ellipse(x+720,y-320,circle,circle);
  ellipse(x+760,y-360,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+280,y);
  vertex(x+320,y-180);
  vertex(x+440,y-180);
  vertex(x+480,y);
  vertex(x+600,y);
  vertex(x+640,y-240);
  vertex(x+680,y-240);
  vertex(x+720,y-320);
  vertex(x+760,y-360);
  endShape();
  for (int i = x+800; i < 1250; i += 40){
    ellipse(i,y,circle,circle);
  }
  line(x+800,y,x+1120,y);
}

void Another_Day_in_Paradise(){
  stroke(80,113,46);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-440,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+60,y-200,circle,circle);
    ellipse(i+80,y-440,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+40,y-360);
    vertex(i+60,y-200);
    vertex(i+80,y-440);
    vertex(i+120,y-360);
    endShape();
  }
  line(x+120,y-360,x+160,y-440);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-440,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+80,y-300,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+40,y-360);
    vertex(i+80,y-300);
    vertex(i+120,y-360);
    endShape();
  }
  line(x+520,y-360,x+560,y-440);
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-360,circle,circle);
    ellipse(i+40,y-440,circle,circle);
    ellipse(i+80,y-360,circle,circle);
    ellipse(i+120,y-120,circle,circle);
    beginShape();
    vertex(i,y-360);
    vertex(i+40,y-440);
    vertex(i+80,y-360);
    vertex(i+120,y-120);
    endShape();
  }
  line(x+920,y-120,x+960,y-360);
}

void Because_I_Love_You_The_Postmas_Song(){
  stroke(217,120,58);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-180,circle,circle);
    ellipse(i+20,y-120,circle,circle);
    ellipse(i+40,y-320,circle,circle);
    ellipse(i+60,y,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+100,y-120,circle,circle);
    beginShape();
    vertex(i,y-180);
    vertex(i+20,y-120);
    vertex(i+40,y-320);
    vertex(i+60,y);
    vertex(i+80,y-180);
    vertex(i+100,y-120);
    endShape();
  }
  ellipse(x+120,y-320,circle,circle);
  beginShape();
  vertex(x+100,y-120);
  vertex(x+120,y-320);
  vertex(x+160,y-180);
  endShape();
  ellipse(x+280,y-300,circle,circle);
  line(x+260,y-120,x+280,y-300);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-80,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+100,y-240,circle,circle);
    beginShape();
    vertex(i,y-80);
    vertex(i+20,y-240);
    vertex(i+40,y);
    vertex(i+80,y-80);
    vertex(i+100,y-240);
    endShape();
  }
  ellipse(x+520,y-320,circle,circle);
  ellipse(x+540,y-240,circle,circle);
  beginShape();
  vertex(x+500,y-240);
  vertex(x+520,y-320);
  vertex(x+540,y-240);
  vertex(x+560,y-80);
  endShape();
  ellipse(x+680,y-300,circle,circle);
  line(x+660,y-240,x+680,y-300);
}

void Black_or_White(){
  stroke(186,209,71);
  for (int i = x; i < 300; i += 40){
    ellipse(i,y,circle,circle);
  }
  ellipse(x+160,y-180,circle,circle);
  ellipse(x+200,y-180,circle,circle);
  ellipse(x+240,y,circle,circle);
  ellipse(x+280,y,circle,circle);
  ellipse(x+320,y-240,circle,circle);
  ellipse(x+360,y-180,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+120,y);
  vertex(x+160,y-180);
  vertex(x+200,y-180);
  vertex(x+240,y);
  vertex(x+280,y);
  vertex(x+320,y-240);
  vertex(x+360,y-180);
  endShape();
  for (int i = x+800; i < 1250; i += 40){
    ellipse(i,y-20,circle,circle);
  }
  line(x+800,y-20,x+1080,y-20);
}

void I_Will_Always_Love_You(){
  stroke(149,75,151);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-420,circle,circle);
    ellipse(i+80,y-320,circle,circle);
    ellipse(i+100,y-140,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+140,y-240,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-420);
    vertex(i+80,y-320);
    vertex(i+100,y-140);
    vertex(i+120,y-180);
    vertex(i+140,y-240);
    endShape();
  }
  line(x+140,y-240,x+160,y-420);
  for (int i = x+400; i < 700; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+20,y-320,circle,circle);
    ellipse(i+40,y-180,circle,circle);
    ellipse(i+60,y-240,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+20,y-320);
    vertex(i+40,y-180);
    vertex(i+60,y-240);
    vertex(i+80,y-420);
    endShape();
  }
  ellipse(x+560,y-420,circle,circle);
  line(x+560,y-420,x+600,y-420);
  ellipse(x+600,y-420,circle,circle);
}

void Thats_the_Way_Love_Goes(){
  stroke(0,88,111);
  ellipse(x,y-300,circle,circle);
  ellipse(x+40,y-360,circle,circle);
  ellipse(x+80,y-440,circle,circle);
  ellipse(x+120,y-440,circle,circle);
  beginShape();
  vertex(x,y-300);
  vertex(x+40,y-360);
  vertex(x+80,y-440);
  vertex(x+120,y-440);
  endShape();
  ellipse(x+160,y-120,circle,circle);
  ellipse(x+200,y-360,circle,circle);
  ellipse(x+240,y-260,circle,circle);
  ellipse(x+280,y-420,circle,circle);
  beginShape();
  vertex(x+160,y-120);
  vertex(x+200,y-360);
  vertex(x+240,y-260);
  vertex(x+280,y-420);
  endShape();
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-300,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+80,y-440,circle,circle);
    ellipse(i+120,y-440,circle,circle);
    beginShape();
    vertex(i,y-300);
    vertex(i+40,y-360);
    vertex(i+80,y-440);
    vertex(i+120,y-440);
    endShape();
  }
  line(x+520,y-440,x+560,y-300);
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-300,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+80,y-440,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-300);
    vertex(i+40,y-360);
    vertex(i+80,y-440);
    vertex(i+120,y-360);
    endShape();
  }
  line(x+920,y-360,x+960,y-300);
}

void Ill_Make_Love_to_You(){
  stroke(238,192,57);
  ellipse(x,y-420,circle,circle);
  ellipse(x+40,y-320,circle,circle);
  ellipse(x+80,y-180,circle,circle);
  ellipse(x+120,y-140,circle,circle);
  ellipse(x+160,y-180,circle,circle);
  ellipse(x+200,y-140,circle,circle);
  ellipse(x+240,y-80,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  beginShape();
  vertex(x,y-420);
  vertex(x+40,y-320);
  vertex(x+80,y-180);
  vertex(x+120,y-140);
  vertex(x+160,y-180);
  vertex(x+200,y-140);
  vertex(x+240,y-80);
  vertex(x+280,y-240);
  endShape();
  ellipse(x+400,y-420,circle,circle);
  ellipse(x+440,y-320,circle,circle);
  ellipse(x+480,y-80,circle,circle);
  ellipse(x+520,y-240,circle,circle);
  ellipse(x+560,y-420,circle,circle);
  ellipse(x+600,y-320,circle,circle);
  ellipse(x+640,y-80,circle,circle);
  ellipse(x+680,y-360,circle,circle);
  ellipse(x+720,y-240,circle,circle);
  ellipse(x+760,y-240,circle,circle);
  beginShape();
  vertex(x+400,y-420);
  vertex(x+440,y-320);
  vertex(x+480,y-80);
  vertex(x+520,y-240);
  vertex(x+560,y-420);
  vertex(x+600,y-320);
  vertex(x+640,y-80);
  vertex(x+680,y-360);
  vertex(x+720,y-240);
  vertex(x+760,y-240);
  endShape();
  ellipse(x+800,y-140,circle,circle);
  ellipse(x+840,y-300,circle,circle);
  ellipse(x+880,y-80,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  ellipse(x+960,y-140,circle,circle);
  ellipse(x+1000,y-300,circle,circle);
  ellipse(x+1040,y-80,circle,circle);
  ellipse(x+1080,y-360,circle,circle);
  ellipse(x+1120,y-240,circle,circle);
  ellipse(x+1160,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-140);
  vertex(x+840,y-300);
  vertex(x+880,y-80);
  vertex(x+920,y-240);
  vertex(x+960,y-140);
  vertex(x+1000,y-300);
  vertex(x+1040,y-80);
  vertex(x+1080,y-360);
  vertex(x+1120,y-240);
  vertex(x+1160,y-240);
  endShape();
}

void One_Sweet_Day(){
  stroke(81,100,170);
  for (int i = x; i < 800; i += 400){
    ellipse(i,y,circle, circle);
    ellipse(i+40,y-180,circle,circle);
    ellipse(i+80,y,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+160,y,circle,circle);
    ellipse(i+200,y-180,circle,circle);
    ellipse(i+240,y-360,circle,circle);
    ellipse(i+280,y-240,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y-180);
    vertex(i+80,y);
    vertex(i+120,y-180);
    vertex(i+160,y);
    vertex(i+200,y-180);
    vertex(i+240,y-360);
    vertex(i+280,y-240);
    endShape();
  }
  ellipse(x+800,y-120,circle,circle);
  ellipse(x+840,y-320,circle,circle);
  ellipse(x+880,y-180,circle,circle);
  ellipse(x+900,y-240,circle,circle);
  ellipse(x+920,y,circle,circle);
  ellipse(x+960,y-120,circle,circle);
  ellipse(x+1000,y-320,circle,circle);
  ellipse(x+1020,y-180,circle,circle);
  ellipse(x+1040,y-80,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-120);
  vertex(x+840,y-320);
  vertex(x+880,y-180);
  vertex(x+900,y-240);
  vertex(x+920,y);
  vertex(x+960,y-120);
  vertex(x+1000,y-320);
  vertex(x+1020,y-180);
  vertex(x+1040,y-80);
  vertex(x+1080,y-240);
  endShape();
}

void Macarena_Bayside_Boys_Mix(){
  stroke(81,100,170);
  for (int i = x; i < 450; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-260,circle,circle);
    line(i,y-420,i+40,y-260);
  }
  for (int i = x+40; i < 400; i += 80){
    line(i,y-260,i+40,y-420);
  }
  for (int i = x+400; i < 900; i += 80){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-260,circle,circle);
    line(i,y-420,i+40,y-260);
  }
  for (int i = x+440; i < 900; i += 80){
    line(i,y-260,i+40,y-420);
  }
  ellipse(x+800,y-180,circle,circle);
  ellipse(x+840,y-180,circle,circle);
  ellipse(x+880,y-140,circle,circle);
  ellipse(x+920,y-140,circle,circle);
  ellipse(x+960,y-80,circle,circle);
  ellipse(x+1000,y-80,circle,circle);
  ellipse(x+1040,y-260,circle,circle);
  ellipse(x+1080,y-260,circle,circle);
  beginShape();
  vertex(x+800,y-180);
  vertex(x+840,y-180);
  vertex(x+880,y-140);
  vertex(x+920,y-140);
  vertex(x+960,y-80);
  vertex(x+1000,y-80);
  vertex(x+1040,y-260);
  vertex(x+1080,y-260);
  endShape();
}

void Something_About_the_Way_You_Look_Tonight(){
  stroke(92,178,156);
  ellipse(x,y,circle,circle);
  ellipse(x+40,y-120,circle,circle);
  ellipse(x+80,y-320,circle,circle);
  ellipse(x+120,y,circle,circle);
  ellipse(x+160,y-180,circle,circle);
  ellipse(x+200,y-80,circle,circle);
  ellipse(x+240,y-240,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  beginShape();
  vertex(x,y);
  vertex(x+40,y-120);
  vertex(x+80,y-320);
  vertex(x+120,y);
  vertex(x+160,y-180);
  vertex(x+200,y-80);
  vertex(x+240,y-240);
  vertex(x+280,y-240);
  endShape();
  ellipse(x+400,y,circle,circle);
  ellipse(x+440,y-120,circle,circle);
  ellipse(x+480,y-320,circle,circle);
  ellipse(x+520,y-320,circle,circle);
  ellipse(x+560,y-80,circle,circle);
  ellipse(x+600,y-80,circle,circle);
  ellipse(x+640,y-240,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  beginShape();
  vertex(x+400,y);
  vertex(x+440,y-120);
  vertex(x+480,y-320);
  vertex(x+520,y-320);
  vertex(x+560,y-80);
  vertex(x+600,y-80);
  vertex(x+640,y-240);
  vertex(x+680,y-240);
  endShape();
  ellipse(x+520,y-180,circle,circle);
  ellipse(x+560,y-240,circle,circle);
  ellipse(x+600,y-240,circle,circle);
  ellipse(x+640,y,circle,circle);
  ellipse(x+680,y,circle,circle);
  beginShape();
  vertex(x+480,y-320);
  vertex(x+520,y-180);
  vertex(x+560,y-240);
  vertex(x+600,y-240);
  vertex(x+640,y);
  vertex(x+680,y);
  endShape();
}

void The_Boy_is_Mine(){
  stroke(125,70,29);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-200,circle,circle);
    ellipse(i+40,y-200,circle,circle);
    ellipse(i+80,y-20,circle,circle);
    ellipse(i+120,y-20,circle,circle);
    beginShape();
    vertex(i,y-200);
    vertex(i+40,y-200);
    vertex(i+80,y-20);
    vertex(i+120,y-20);
    endShape();
  }
  line(x+120,y-20,x+160,y-200);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-200,circle,circle);
    ellipse(i+40,y-200,circle,circle);
    ellipse(i+80,y-20,circle,circle);
    ellipse(i+120,y-20,circle,circle);
    beginShape();
    vertex(i,y-200);
    vertex(i+40,y-200);
    vertex(i+80,y-20);
    vertex(i+120,y-20);
    endShape();
  }
  line(x+520,y-20,x+560,y-200);
}

void Smooth_Santana(){
  stroke(89,39,91);
  for (int i = x; i < 300; i += 80){
    ellipse(i,y-440,circle,circle);
    ellipse(i+20,y-300,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+20,y-300);
    vertex(i+40,y-240);
    endShape();
  }
  line(x+40,y-240,x+80,y-440);
  ellipse(x+160,y-200,circle,circle);
  ellipse(x+200,y-240,circle,circle);
  ellipse(x+240,y-440,circle,circle);
  ellipse(x+260,y-300,circle,circle);
  ellipse(x+280,y-240,circle,circle);
  beginShape();
  vertex(x+120,y-240);
  vertex(x+160,y-200);
  vertex(x+200,y-240);
  vertex(x+240,y-440);
  vertex(x+260,y-300);
  vertex(x+280,y-240);
  endShape();
  for (int i = x+400; i < 800; i += 80){
    ellipse(i,y-440,circle,circle);
    ellipse(i+20,y-300,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+20,y-300);
    vertex(i+40,y-240);
    endShape();
  }
  for (int i = x+440; i < 700; i += 80){
    line(i,y-240,i+40,y-440);
  }
  ellipse(x+640,y-200,circle,circle);
  ellipse(x+680,y-240,circle,circle);
  beginShape();
  vertex(x+600,y-240);
  vertex(x+640,y-200);
  vertex(x+680,y-240);
  endShape();
}

void Maria_Maria() {
  stroke(107, 39, 90);
  for (int i = x; i < 400; i += 160) {
    ellipse(i, y-440, circle, circle);
    ellipse(i+40, y-360, circle, circle);
    ellipse(i+80, y-300, circle, circle);
    ellipse(i+120, y-260, circle, circle);
    beginShape();
    vertex(i, y-440);
    vertex(i+40, y-360);
    vertex(i+80, y-300);
    vertex(i+120, y-260);
    endShape();
  }
  line(x+120, y-260, x+160, y-440);
  ellipse(x+400, y-200, circle, circle);
  ellipse(x+440, y-200, circle, circle);
  ellipse(x+480, y-20, circle, circle);
  ellipse(x+520, y-20, circle, circle);
  ellipse(x+560, y-260, circle, circle);
  ellipse(x+600, y-260, circle, circle);
  ellipse(x+640, y-20, circle, circle);
  ellipse(x+680, y-20, circle, circle);
  beginShape();
  vertex(x+400, y-200);
  vertex(x+440, y-200);
  vertex(x+480, y-20);
  vertex(x+520, y-20);
  vertex(x+560, y-260);
  vertex(x+600, y-260);
  vertex(x+640, y-20);
  vertex(x+680, y-20);
  endShape();
  for (int i = x+800; i < 1100; i += 40) {
    ellipse(i, y-20, circle, circle);
  }
  line(x+800, y-20, x+920, y-20);
}

void All_For_You(){
  stroke(17,146,183);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-320,circle,circle);
    ellipse(i+20,y-420,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+60,y-320,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-240,circle,circle);
    ellipse(i+140,y-320,circle,circle);
    beginShape();
    vertex(i,y-320);
    vertex(i+20,y-420);
    vertex(i+40,y-240);
    vertex(i+60,y-320);
    vertex(i+80,y-80);
    vertex(i+120,y-240);
    vertex(i+140,y-320);
    endShape();
  }
  line(x+140,y-320,x+160,y-320);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-320,circle,circle);
    ellipse(i+20,y-420,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+60,y-320,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-240,circle,circle);
    ellipse(i+140,y-320,circle,circle);
    beginShape();
    vertex(i,y-320);
    vertex(i+20,y-420);
    vertex(i+40,y-240);
    vertex(i+60,y-320);
    vertex(i+80,y-80);
    vertex(i+120,y-240);
    vertex(i+140,y-320);
    endShape();
  }
  line(x+540,y-320,x+560,y-320);
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-320,circle,circle);
    ellipse(i+20,y-420,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+60,y-320,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-240,circle,circle);
    ellipse(i+140,y-320,circle,circle);
    beginShape();
    vertex(i,y-320);
    vertex(i+20,y-420);
    vertex(i+40,y-240);
    vertex(i+60,y-320);
    vertex(i+80,y-80);
    vertex(i+120,y-240);
    vertex(i+140,y-320);
    endShape();
  }
  line(x+940,y-320,x+960,y-320);
}

void Lose_Yourself(){
  stroke(137,112,30);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-440,circle,circle);
    ellipse(i+40,y-300,circle,circle);
    ellipse(i+80,y-440,circle,circle);
    ellipse(i+120,y-300,circle,circle);
    ellipse(i+140,y-360,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+40,y-300);
    vertex(i+80,y-440);
    vertex(i+120,y-300);
    vertex(i+140,y-360);
    endShape();
  }
  line(x+140,y-360,x+160,y-440);
  for (int i = x+400; i < 850; i += 80){
    ellipse(i,y-440,circle,circle);
    ellipse(i+40,y-300,circle,circle);
    ellipse(i+60,y-360,circle,circle);
    beginShape();
    vertex(i,y-440);
    vertex(i+40,y-300);
    vertex(i+60,y-360);
    endShape();
  }
  for (int i = x+460; i < 850; i += 80){
    line(i,y-360,i+20,y-440);
  }
}

void In_Da_Club(){
  stroke(125,70,29);
  for (int i = x; i < 550; i += 40){
    ellipse(i,y-440,circle,circle);
  }
  line(x,y-440,x+360,y-440);
  for (int i = x+400; i < 850; i += 40){
    ellipse(i,y-440,circle,circle);
  }
  line(x+400,y-440,x+680,y-440);
  for (int i = x+800; i < 1100; i += 40){
    ellipse(i,y-440,circle,circle);
  }
  line(x+800,y-440,x+920,y-440);
}

void Yeah(){
  stroke(0,88,111);
  for (int i = x; i < 1250; i += 40){
    ellipse(i,y-20,circle,circle);
  }
  line(x,y-20,x+360,y-20);
  line(x+400,y-20,x+760,y-20);
  line(x+800,y-20,x+1080,y-20);
}

void We_Belong_Together(){
  stroke(207, 66, 51);
  for (int i = x; i < 500; i += 80){
    ellipse(i,y-180,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y-140,circle,circle);
    ellipse(i+60,y-180,circle,circle);
    line(i,y-180,i+20,y-240);
    line(i+20,y-240,i+40,y-140);
    line(i+40,y-140,i+60,y-180);
  }
  for (int i = x+60; i < 500; i += 80){
    line(i,y-180,i+20,y-180);
  }
  for (int i = x+400; i < 850; i += 80){
    ellipse(i,y-180,circle,circle);
    ellipse(i+20,y-240,circle,circle);
    ellipse(i+40,y-140,circle,circle);
    ellipse(i+60,y-180,circle,circle);
    line(i,y-180,i+20,y-240);
    line(i+20,y-240,i+40,y-140);
    line(i+40,y-140,i+60,y-180);
  }
  for (int i = x+460; i < 850; i += 80){
    line(i,y-180,i+20,y-180);
  }
}

void Irreplaceable(){
  stroke(180,76,151);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-200,circle,circle);
    ellipse(i+140,y-240,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y-240);
    vertex(i+80,y-80);
    vertex(i+120,y-200);
    vertex(i+140,y-240);
    endShape();
  }
  line(x+140,y-240,x+160,y);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+80,y-80,circle,circle);
    ellipse(i+120,y-200,circle,circle);
    beginShape();
    vertex(i,y);
    vertex(i+40,y-240);
    vertex(i+80,y-80);
    vertex(i+120,y-200);
    endShape();
  }
  line(x+520,y-200,x+560,y);
  ellipse(x+720,y-200,circle,circle);
  line(x+680,y-200,x+720,y-200);
  ellipse(x+720,y-240,circle,circle);
  ellipse(x+760,y-240,circle,circle);
  beginShape();
  vertex(x+680,y-200);
  vertex(x+720,y-240);
  vertex(x+760,y-240);
  endShape();
  ellipse(x+800,y-180,circle,circle);
  ellipse(x+840,y-240,circle,circle);
  ellipse(x+880,y-420,circle,circle);
  ellipse(x+900,y-240,circle,circle);
  ellipse(x+920,y-320,circle,circle);
  ellipse(x+940,y-140,circle,circle);
  ellipse(x+960,y-60,circle,circle);
  ellipse(x+1000,y-180,circle,circle);
  ellipse(x+1040,y-240,circle,circle);
  ellipse(x+1080,y-240,circle,circle);
  beginShape();
  vertex(x+800,y-180);
  vertex(x+840,y-240);
  vertex(x+880,y-420);
  vertex(x+900,y-240);
  vertex(x+920,y-320);
  vertex(x+940,y-140);
  vertex(x+960,y-60);
  vertex(x+1000,y-180);
  vertex(x+1040,y-240);
  vertex(x+1080,y-240);
  endShape();
}

void Umbrella(){
  stroke(217,120,58);
  for (int i = x; i < 400; i += 160){
    ellipse(i,y-180,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    ellipse(i+80,y-120,circle,circle);
    ellipse(i+120,y-320,circle,circle);
    beginShape();
    vertex(i,y-180);
    vertex(i+40,y-240);
    vertex(i+80,y-120);
    vertex(i+120,y-320);
    endShape();
  }
  line(x+120,y-320,x+160,y-180);
  for (int i = x+400; i < 800; i += 160){
    ellipse(i,y-180,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+80,y-240,circle,circle);
    ellipse(i+120,y-320,circle,circle);
    beginShape();
    vertex(i,y-180);
    vertex(i+40,y);
    vertex(i+80,y-240);
    vertex(i+120,y-320);
    endShape();
  }
  line(x+520,y-320,x+560,y-180);
  ellipse(x+800,y-360,circle,circle);
  ellipse(x+840,y-180,circle,circle);
  ellipse(x+880,y,circle,circle);
  ellipse(x+920,y-240,circle,circle);
  ellipse(x+960,y-360,circle,circle);
  ellipse(x+1000,y-180,circle,circle);
  ellipse(x+1040,y-120,circle,circle);
  ellipse(x+1080,y-120,circle,circle);
  beginShape();
  vertex(x+800,y-360);
  vertex(x+840,y-180);
  vertex(x+880,y);
  vertex(x+920,y-240);
  vertex(x+960,y-360);
  vertex(x+1000,y-180);
  vertex(x+1040,y-120);
  vertex(x+1080,y-120);
  endShape();
}

void Low(){
  stroke(134,134,32);
  for (int i = x; i < 950; i += 40){
    ellipse(i,y-20,circle,circle);
  }
  line(x,y-20,x+360,y-20);
  line(x+400,y-20,x+760,y-20);
}

void I_Gotta_Feeling(){
  stroke(17,146,183);
  for (int i = x; i < 1300; i += 400){
    ellipse(i,y-420,circle,circle);
    ellipse(i+40,y-420,circle,circle);
    ellipse(i+80,y-180,circle,circle);
    ellipse(i+120,y-180,circle,circle);
    ellipse(i+160,y-320,circle,circle);
    ellipse(i+200,y-320,circle,circle);
    ellipse(i+240,y-180,circle,circle);
    ellipse(i+280,y-180,circle,circle);
    beginShape();
    vertex(i,y-420);
    vertex(i+40,y-420);
    vertex(i+80,y-180);
    vertex(i+120,y-180);
    vertex(i+160,y-320);
    vertex(i+200,y-320);
    vertex(i+240,y-180);
    vertex(i+280,y-180);
    endShape();
  }
}

void Tik_Tok(){
  stroke(137,112,30);
  for (int i = x; i < 770; i += 80){
    ellipse(i,y-300,circle,circle);
    ellipse(i+40,y-360,circle,circle);
    ellipse(i+60,y-440,circle,circle);
    beginShape();
    vertex(i,y-300);
    vertex(i+40,y-360);
    vertex(i+60,y-440);
    endShape();
  }
  for (int i = x+60; i < 500; i += 80){
    line(i,y-440,i+20,y-300);
  }
  ellipse(x+640,y-200,circle,circle);
  ellipse(x+680,y-440,circle,circle);
  ellipse(x+700,y-360,circle,circle);
  line(x+460,y-440,x+480,y-300);
  line(x+540,y-440,x+560,y-300);
  beginShape();
  vertex(x+620,y-440);
  vertex(x+640,y-200);
  vertex(x+680,y-440);
  vertex(x+700,y-360);
  endShape();
  for (int i = x+800; i < 1200; i += 160){
    ellipse(i,y-300,circle,circle);
    ellipse(i+40,y-200,circle,circle);
    ellipse(i+80,y-440,circle,circle);
    ellipse(i+120,y-360,circle,circle);
    beginShape();
    vertex(i,y-300);
    vertex(i+40,y-200);
    vertex(i+80,y-440);
    vertex(i+120,y-360);
    endShape();
  }
  line(x+920,y-360,x+960,y-300);
}

void We_Found_Love(){
  stroke(92, 178, 156);
  for (int i = x; i < 900; i += 80){
    ellipse(i,y-320,circle,circle);
    ellipse(i+20,y-180,circle,circle);
    ellipse(i+40,y,circle,circle);
    ellipse(i+60,y-80,circle,circle);
    line(i,y-320,i+20,y-180);
    line(i+20,y-180,i+40,y);
    line(i+40,y,i+60,y-80);
  }
  for (int i = x+60; i < 500; i += 80){
    line(i,y-80,i+20,y-320);
  }
  for (int i = x+460; i < 900; i += 80){
    line(i,y-80,i+20,y-320);
  }
  for (int i = x+800; i < 1250; i += 40){
    ellipse(i,y-320,circle,circle);
  }
  line(x+800,y-320,x+1080,y-320);
}

void Call_Me_Maybe(){
  stroke(17,146,183);
  for (int i = x; i < 1250; i += 80){
    ellipse(i,y-180,circle,circle);
    ellipse(i+40,y-240,circle,circle);
    line(i,y-180,i+40,y-240);
  }
  for (int i = x+40; i < 500; i += 80){
    line(i,y-240,i+40,y-180);
  }
  for (int i = x+440; i < 900; i += 80){
    line(i,y-240,i+40,y-180);
  }
  for (int i = x+840; i < 1200; i += 80){
    line(i,y-240,i+40,y-180);
  }
}


// BRACKETS
// These functions map out the brackets that divide up the songs into parts such as verse, chorus, and bridge. They are included with the chronology function.

void Verse_Chorus_Coda(){
  strokeWeight(1);
  stroke(0);
  noFill();
  for (int i = x; i < 800; i += 400){
    beginShape();
    vertex(i,y+35);
    vertex(i,y+45);
    vertex(i+395,y+45);
    endShape();
  }
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Chorus",x+580,y+50);
  text("Coda",x+960,y+50);
}

void longVerse(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+565,y+50);
}

void Verse_Bridge_Coda(){
  strokeWeight(1);
  stroke(0);
  noFill();
  for (int i = x; i < 800; i += 400){
    beginShape();
    vertex(i,y+35);
    vertex(i,y+45);
    vertex(i+395,y+45);
    endShape();
  }
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Bridge",x+580,y+50);
  text("Coda",x+960,y+50);
}

void longVerse_Bridge(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+795,y+45);
  endShape();
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+385,y+50);
  text("Bridge",x+960,y+50);
}

void Verse_Chorus_Bridge(){
  strokeWeight(1);
  stroke(0);
  noFill();
  for (int i = x; i < 800; i += 400){
    beginShape();
    vertex(i,y+35);
    vertex(i,y+45);
    vertex(i+395,y+45);
    endShape();
  }
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Chorus",x+580,y+50);
  text("Bridge",x+960,y+50);
}

void Verse_shortChorus(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+395,y+45);
  endShape();
  beginShape();
  vertex(x+400,y+35);
  vertex(x+400,y+45);
  vertex(x+800,y+45);
  vertex(x+800,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Chorus",x+580,y+50);
}

void longVerse_Chorus(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+795,y+45);
  endShape();
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+385,y+50);
  text("Chorus",x+960,y+50);
}

void longVerse_Coda(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+795,y+45);
  endShape();
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+385,y+50);
  text("Coda",x+960,y+50);
}

void Verse_longChorus(){
  strokeWeight(1);
  stroke(0);
  noFill();
  beginShape();
  vertex(x,y+35);
  vertex(x,y+45);
  vertex(x+395,y+45);
  endShape();
  beginShape();
  vertex(x+400,y+35);
  vertex(x+400,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Chorus",x+765,y+50);
}

void Verse_Bridge1_Bridge2(){
  strokeWeight(1);
  stroke(0);
  noFill();
  for (int i = x; i < 800; i += 400){
    beginShape();
    vertex(i,y+35);
    vertex(i,y+45);
    vertex(i+395,y+45);
    endShape();
  }
  beginShape();
  vertex(x+800,y+35);
  vertex(x+800,y+45);
  vertex(x+1160,y+45);
  vertex(x+1160,y+35);
  endShape();
  textFont(font,14);
  fill(0);
  text("Verse",x+185,y+50);
  text("Bridge 1",x+580,y+50);
  text("Bridge 2",x+960,y+50);
}

