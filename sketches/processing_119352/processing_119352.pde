
PFont font, font2, font3;
float timer;
//String s = "Barbie Pink Pretty Hot Plastic Blonde";
String p = "2 + 2 = 00110100";

void setup()
{
  size(400,400);
  font = createFont("Barbie",0);
  font2 = loadFont("Times New Roman",0);
  font3 = createFont("Double Feature",0);
}

void draw()
{
  timer += 0.0167;
  println(timer);
  
  
  
  //pushMatrix();
  //translate(64,109);
  
  if (timer > 0 && timer < 6)
  {
     fill(#1d1d1d);
     rect(0,0,width,height);
     
     fill(#e02b89);
     textFont(font);
     textSize(4);
  
    text("Toy Pets Love Everything Career",109,60);
    text("Pretty Girls Hot Cars Toy Pets Love Everything Career", 91,65);
    text("Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career",81,70);
    text("Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup ", 70,75);
    text("Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist",61,80);
    text("Dumb Princess Nice Career Writer Artist 50 Makeup Plastic Blonde Cute White Cute White",55,85);
    text("Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White ", 49, 90);
    text("Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb ",43,95);
    text("Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess ",38,100);
    text("Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink ",31,105);
    text("Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot ", 29,110);
    text("Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Career Writer Artist 50 Makeup Plastic Blonde ",27,115);
    text("Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic ",25,120);
    text("Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White ",22,125);
    text("Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice ",18,130);
    text("Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls ",15,135);
    text("Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets ",12,140);
    text("Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Career Writer Artist 50 Makeup Plastic Blonde Cute WhiteCute ",13,145);
    text("Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess ",9,150);
    text("Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls ",8,155);
    text("Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything ",10,160);
    text("Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup ",22,165);
    text("Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White ",28,170);
    text("Plastic Blonde Cute WhiteCute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything ",26,175);
    text("White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup ",26,180);
    text("Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb ",25,185);
    text("Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty ",26,190);
    text("50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love ",28,195);
    text("Cute White Dumb Princess Nice Career Writer Artist 50 Makeup Plastic Blonde Cute WhiteCute White Dumb ",25,200);
    text("Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls ",19,205);
    text("Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love",18,210);
    text("Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer",14,215);
    text("50 White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 ",12,220);
    text("Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 ",19,225);
    text("Dumb Princess Nice Career Writer Artist 50 Makeup Plastic Blonde Cute WhiteCute White Dumb ",24,230);
    text("Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb ",21,235);
    text("Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb ",19,240);
    text("Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb ",25,245);
    text("Everything Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice ",21,250);
    text("Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie ",23,255);
    text("Career Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Career ",22,260);
    text("White Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets ",26,265);
    text("Writer Artist 50 Makeup ",112,270);
    text("Plastic Blonde Cute ",116,275);
    text("White Dumb ",121,280);
    text("Princess Nice ",120,285);
    text("Barbie Pink ",122,290);
    text("Pretty Girls Hot ",118,295);
    text("Cars Toy Pets ",119,300);
    text("Love Everything ",116,305);
    text("Career Writer Artist ",114,310);
    text("50 Makeup Plastic ",115,315);
    text("Blonde Cute White ",114,320);
    text("Dumb Princess Nice ",110,325);
    text("Pink Pretty Girls Hot Cars Toy ",104,330);
    text("Pets Love Everything Career ",105,335);
    text("Writer Artist 50 Makeup Plastic ",103,340);
    text("Blonde Cute White Dumb Princess Nice ",96,345);
    text("Barbie Pink Pretty Girls Hot Cars Toy Pets",95,350);
    text("Love Everything Career Writer Artist 50 Makeup ",92,355);
    text("Plastic Blonde Cute White Dumb Princess Nice Barbie ",86,360);
    text("Pink Pretty Girls Hot Cars Toy Pets Love Everything Career ",84,365);
    text("Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess ",78,370);
    text("Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career ",74,375);
    text("Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice ",67,380);
    text("Career Writer Artist 50 Makeup Plastic Blonde Cute WhiteCute White ",62, 385);
    text("Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets ",58,390);
    
    text("Barbie ",278,10);
    text("Pink Pretty Girls Hot Cars Toy Pets ",258,15);
    text("Love Everything Career Writer Artist 50 Makeup ",248,20);
    text("Plastic Blonde Cute White Dumb Princess Nice Barbie Pink ",249,25);
    text("Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 ",233,30);
    text("Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls ",225,35);
    text("Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde Cute ",220,40);
    text("White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Barbie ",216,45);
    text("Pink Pretty Girls Hot Cars Toy Pets Love Everything Career Writer Artist 50 Makeup Plastic Blonde ",208,50);
    text("Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love Everything Career ",204,55);
    text("Writer Artist 50 Makeup Plastic Blonde Cute White Dumb Princess Nice Barbie Pink Pretty Girls Hot Cars ",197,60);
    text("Cute White Dumb Princess Nice Barbie Pink ",285,65);
    text("Writer Artist 50 Makeup Plastic Blonde ",197,65);
    text("Blonde Cute White Dumb Princess Nice ",288,70);
    text("Writer Artist 50 Makeup Plastic ",192,70);
    text("Writer Artist 50 Makeup ",188,75);
    text("Plastic Blonde Cute White Dumb Princess ",286,75);
    text("Cute White Dumb Princess Nice Barbie Pink ",284,80);
    text("Blonde Cute White Dumb Princess Nice ",288,85);
    text("Plastic Blonde Cute White Dumb Princess ",286,90);
    text("Plastic Blonde Cute White Dumb ",292,95);
    text("50 Makeup Plastic Blonde Cute White ",287,100);
    text("Dumb Princess Nice Barbie Pink Pretty ",282,105);
    text("Dumb Princess Nice Barbie Pink Pretty ",280,110);
    text("Princess Nice Barbie Pink Pretty Girls ",278,115);
    text("Nice Barbie Pink Pretty Girls Hot Cars ",275,120);
    text("Pretty Girls Hot Cars Toy Pets Love ",274,125);
    text("Cars Toy Pets Love Everything Career ",269,130);
    text("Cute White Cute White Cute White ",268,135);
    text("Blonde Cute White Dumb Princess");
    text("Dumb Princess Nice Barbie Pink ",263,140);
    text("Barbie Pink Pretty Girls Hot Cars ",259,145);
    text("Hot Cars Toy Pets Love ",264,150);
    text("Love Everything Career Writer ",256,155);
    text("White Dumb Princess Nice ",255,160);
    text("Nice Barbie Pink Pretty ",256,165);
    text("Hot Cars Toy Pets Love ",252,170);
    text("Everything ",360,170);
    text("Career Writer Artist 50 ",250,175);
    text("Makeup Plastic ",355,175);
    text("Plastic Blonde Cute ",252,180);
    text("White Dumb Princess ",351,180);
    text("Dumb Princess ",253,185);
    text("Nice Career Writer Artist 50",343,185);
    text("Career Writer ",254,190);
    text("Artist 50 Makeup Plastic Blonde ",340,190);
    text("Plastic Blonde ",251,195);
    text("Cute White Dumb Princess Nice",336,195);
    text("Princess Nice ",251,200);
    text("Barbie Pink Pretty Girls Hot Cars Toy",333,200);
    text("Girls Hot Cars ",250,205);
    text("Toy Pets Love Everything Career Writer Art",330,205);
    text("Everything ",252,210);
    text("Career Writer Artist 50 Makeup Plastic Blonde",327,210);
    text("Princess Nice",251,215);
    text("Barbie Pink Pretty Girls Hot Cars Toy Pets Love ",324,215);
    text("Hot Cars Toy ",253,220);
    text("Everything Career Writer ",355,220);
    text("Pets Love",323,220);
    text("Writer", 320,225);
    text("Everything Career ",251,225);
    text("Artist 50 Makeup Plastic ",358,225);
    text("Artist 50 Makeup ",250,230);
    text("Plastic Blonde Cute ",360,230);
    text("Makeup Plastic ",258,235);
    text("Blonde Cute White ",357,235);
    text("Makeup Plastic ",261,240);
    text("Blonde Cute White ",357,240);
    text("Princess Nice Barbie ",260,245);
    text("Pink Pretty Girls Hot",355,245);
    text("Pink Pretty Girls Hot ",350,250);
    text("Princess Nice Barbie ",264,250);
    text("Pretty Girls Hot Cars Toy",342,255);
    text("Princess Nice Barbie Pink",265,255);
    text("Princess Nice Barbie Pink Pretty Girls Hot Cars Toy Pets Love ",276,260);
    text("Pink Pretty Girls Hot Cars Toy Pets Love Everything ",284,265);
    text("Writer Artist 50 Makeup Plastic Blonde Cute ",289,270);
    text("Love Everything Career ",305,275);
    //popMatrix();
}

  fill(#FFFFFF);
  textFont(font2);


  if (timer > 6)
{
  fill(#1d1d1d,24);
  rect(0,0,width,height);
  fill(255,0,0);
    textFont(font3);
  textSize(20);
  text(p,random(-400,400),random(-40,420));
}
  
  if (timer > 4)
  {
    textSize(5);
    text("Space ",119,80);
    text("Space Space Space Space Space ",91,85);
    text("Space Space Space Space Space Space Space ",79,90);
    text("Space Space Space Space Space Space Space Space ",75,95);
    text("Space Space Space Space Space Space Space Space Space ",69,100);
    text("Space Space Space Space Space Space Space Space Space Space ",65,105);
    text("Space Space Space Space Space Space Space Space Space Space Space",60,110 );
    text("Space Space Space Space Space Space Space Space Space Space Space ",60,115);
    text("Space Space Space Space Space Space Space Space Space Space Space ",60,120);
    text("Space Space Space Space Space Space Space Space Space Space Space Space ",56,125);
    text("Space Space Space Space Space Space Space Space Space Space Space Space ",57,130);
    text("Space Space Space Space Space Space Space Space Space Space Space Space ",58,135);
    text("Space Space Space Space Space Space Space Space Space Space Space Space ",60,140);
    text("Space Space Space Space Space Space Space Space Space Space Space Space ",61,145);
    text("Space Space Space Space Space Space Space Space Space Space Space",70,150);
    text("Space Space Space Space Space Space Space Space Space",77,155);
    text("Space Space Space Space Space Space Space Space",79,160);
    text("Space Space Space Space Space",85,165);
    text("Space Space Space",134,175);
    text("Space Space ",136,180);
    text("Space",140,185);
  }
}


