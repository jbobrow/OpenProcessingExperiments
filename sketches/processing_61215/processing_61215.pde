
PImage usmap;
PImage bostonimg;
PImage chicagoimg;
PImage newyorkimg;
PImage oaklandimg;
PImage DCimg;
PImage Davis;
PImage Davisimg;
PImage Seattle;
PImage IRvine;
PImage phoenix; 
int oakland = 20;
int irvine = 20;
int fairbank = 20;
int davis = 20;
int corvallis = 20;
int birmingham = 20;
int pheonix = 20;
int littlerock = 20;
int wilmington = 20;
int DC = 20;
int tallahassee = 20;
int chicago = 20;
int indianapolis = 20;
int louisville = 20;
int batonrouge = 20;
int baltimore = 20;
int boston = 20;
int grandrapids = 20;
int lansing = 20;
int jackson = 20;
int carsoncity = 20;
int hanover = 20;
int atlanticcity = 20;
int buffalo = 20;
int NYC = 20;
int syracuse = 20;
int greensboro = 20;
int cleveland = 20;
int oklahomacity = 20;
int pittsburg = 20;
int harrisburg = 20;
int hiltonhead = 20;
int rapidcity = 20;
int siouxfalls = 20;
int fortworth = 20;
int sanantonio = 20;
int parkcity = 20;
int burlington = 20;
int richmond = 20;
int charlotsville = 20;
int seattle = 20;
int huntington = 20;
int martinsburg = 20;
int madison = 20;
int milwaukee = 20;
int casper = 20;

PFont font;

int modX, modY;


void setup() {
  smooth();
  size(750, 460);
  usmap= loadImage("united_states_map_empty.jpeg");
  font = loadFont("Copperplate-48.vlw");
 bostonimg = loadImage("Ocuppy Boston.jpeg");
 chicagoimg= loadImage("Chicago.jpeg");
 newyorkimg= loadImage("New York.jpeg");
 oaklandimg= loadImage("oakland.jpg");
 DCimg = loadImage("Occupy DC.jpg");
 Davis = loadImage("Davis.jpeg");
 Davisimg = loadImage("Davis.jpg");
 Seattle = loadImage("Occupyseattle.jpg");
 IRvine = loadImage("Irvine.jpg");
 phoenix = loadImage("4.jpeg");
}

void draw() {

  background(255);

  pushMatrix();

  translate(50, 50);
  scale(0.9*2/3);


  modX = int(1.5*(mouseX-50))+50;
  modY = int(1.5*(mouseY-50))+50;

  image(usmap, 0, 0, 1000, 1000*usmap.height/usmap.width);

  println("x : "+modX+" y : "+modY);
  fill(131, 66, 66);
  ellipse(186, 447, irvine, irvine);// California Irvine
  fill(216, 179, 179);
  ellipse(183, 231, corvallis, corvallis); // Oregon corvallis
  fill( 178, 122, 122);
  ellipse(718, 486, birmingham, birmingham);// Alabama birmingham
  fill(206, 164, 164);
  ellipse(75, 48, fairbank, fairbank);// Alaska fairbanks
  fill(142, 76, 76);
  ellipse(285, 487, pheonix, pheonix); // Arizonia Pheonix
  fill(162, 102, 102);
  ellipse(630, 470, littlerock, littlerock);// Arkansas- Little rock
  fill(103, 41, 41);
  ellipse(148, 337, davis, davis);// Calirnia Davis
  fill(0, 0, 0);
  ellipse(138, 390, oakland, oakland); //California Oakland
  fill(193, 144, 144);
  ellipse(904, 358, wilmington, wilmington);// Wilmington Delaware
  fill(113, 49, 49);
  ellipse(876, 354, DC, DC); // district of columbia (DC)
  fill(193, 144, 144);
  ellipse(793, 560, tallahassee, tallahassee);// Florida Tallahassee
  fill(85, 26, 26);
  ellipse(690, 322, chicago, chicago);// Chicago
  fill(142, 76, 76);
  ellipse(725, 346, indianapolis, indianapolis);// Indianapolis
  fill( 178, 122, 122);
  ellipse(730, 400, louisville, louisville);// Lousisville
  fill(198, 152, 152);
  ellipse(647, 561, batonrouge, batonrouge);// Baton Rouge louisiana
  fill(185, 133, 133);
  ellipse(881, 346, baltimore, baltimore);// Baltimore Maryland
  fill(70, 18, 18);
  ellipse(961, 263, boston, boston);// Boston
  fill(170, 112, 112);
  ellipse(726, 295, grandrapids, grandrapids);// Grand Rapids
  fill(170, 112, 112);
  ellipse(746, 287, lansing, lansing);// Lansing
  fill(234, 213, 213);
  ellipse(664, 528, jackson, jackson);// Jasckson
  fill(224, 192, 192);
  ellipse( 186, 337, carsoncity, carsoncity); // Carson City
  fill(255, 252, 252);
  ellipse(935, 230, hanover, hanover);// new hampshire Hanover
  fill(229, 204, 204);
  ellipse(911, 340, atlanticcity, atlanticcity);// New Jersey atlantic city
  fill(185, 133, 133);
  ellipse(840, 270, buffalo, buffalo);// Buffalo NY
  fill(49, 9, 9);
  ellipse(903, 258, NYC, NYC);// NYC
  fill(185, 133, 133);
  ellipse(872, 252, syracuse, syracuse);// Syracuse new york
  fill(155, 92, 92);
  ellipse(825, 434, greensboro, greensboro);// NC Greensboro
  fill(193, 144, 144);
  ellipse(803, 320, cleveland, cleveland); // Ceavland Ohio
  fill(206, 164, 164);
  ellipse(540, 450, oklahomacity, oklahomacity);// Oklahoma city oklahoma
  fill(124, 57, 57);
  ellipse(824, 335, pittsburg, pittsburg);//Pittsburg pennsylvania
  fill(206, 164, 164);
  ellipse(878, 328, harrisburg, harrisburg);// Harrisburg pennsylvania
  ellipse(836, 495, hiltonhead, hiltonhead);// Hiltonhead south carolina
  fill(234, 213, 213);
  ellipse(455, 277, rapidcity, rapidcity);// Rapid City south dakota
  fill(234, 213, 213);
  ellipse(552, 292, siouxfalls, siouxfalls);// Siox Falls, SD
  fill(185, 133, 133);
  ellipse(537, 512, fortworth, fortworth);// Fort Worth texas
  fill(185, 133, 133);
  ellipse(516, 586, sanantonio, sanantonio); // San Antonio texas
  fill(245, 232, 232); 
  ellipse(328, 331, parkcity, parkcity);// Park City utah
  fill(142, 76, 76);
  ellipse(913, 234, burlington, burlington); //Burlington VT
  fill(185, 133, 133);
  ellipse(889, 382, richmond, richmond);// Richmond virginia
  fill(198, 152, 152);
  ellipse(866, 370, charlotsville, charlotsville);// Charlottesville virginia
  fill(103, 41, 41);
  ellipse(199, 146, seattle, seattle);// Seattle washington
  fill(206, 164, 164);
  ellipse(793, 386, huntington, huntington);// Huntington west virginia
  fill(206, 164, 164);
  ellipse(847, 356, martinsburg, martinsburg);// Martinsburg west virginia
  fill(185, 133, 133);
  ellipse(672, 293, madison, madison);// Madison, Wisconsin
  fill(142, 76, 76);
  ellipse(692, 301, milwaukee, milwaukee);// Milwaukee wisconsin
  fill(234, 213, 213);
  ellipse(387, 295, casper, casper);// Casper wyoming


  popMatrix();


  //button function


  noStroke();
  fill(255, 0, 0, 0);
  ellipse(400, 90, 200, 80);

  // fairbanks rectangle
  //100 people
  // October 15,2011
  if (modX > 106 && modX < 126) {
    if (modY > 83 && modY < 103) {
      fairbank = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Fairbanks, Alaska", 400, 110);
      text("Avg. People 100", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    } 
    else {
      fairbank = 20;
    }
  }

  // Oakland, CA
  //50,000 October  10,2011
  if (modX > 165 && modX < 185) {
    if (modY > 393 && modY < 413) {
      oakland = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Oakland, California", 400, 110);
      text("Avg. People 50,000", 400, 130);
      text("Start Date: October 10,2011", 400, 150);
        image(oaklandimg, 700, 50, 200, 200*oaklandimg.height/oaklandimg.width);
    }
  } 
  else {
    oakland = 20;
  }

  //irvine, CA
  //1,200 October 15,2011
  if (modX > 208 && modX < 228) {
    if (modY > 435 && modY < 455) {
      irvine = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("IRvine, California", 400, 110);
      text("Avg. People 1,200", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
      image(IRvine, 700, 50, 200, 200*IRvine.height/IRvine.width);
    }
  } 
  else {
    irvine = 20;
  }

  //davis, CA
  //5,000 October  20,2011
  if (modX > 174 && modX < 194) {
    if (modY > 345 && modY < 365) {
      davis = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Davis, California", 430, 110);
      text("Avg. People 5,000", 430, 130);
      text("Start Date: October 20,2011", 430, 150);
      image(Davis, 700, 20, 200, 200*Davis.height/Davis.width);
      image(Davisimg, 200, 20, 200, 200*Davisimg.height/Davisimg.width);
    }
  } 
  else {
    davis = 20;
  }

  //corvallis, OR
  //80 October 6 2011
  if (modX > 206 && modX < 226) {
    if (modY > 249 && modY < 269) {
      corvallis = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Corvallis, Oregon", 400, 110);
      text("Avg. People 80", 400, 130);
      text("Start Date: October 6,2011", 400, 150);
    }
  } 
  else {
    corvallis = 20;
  }

  //seattle, WA
  //5,000 October 6,2011
  if (modX > 220 && modX < 240) {
    if (modY > 172 && modY < 192) {
      seattle = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Seattle, Washington", 400, 110);
      text("Avg. People 5,000", 400, 130);
      text("Start Date: October 6,2011", 400, 150);
      image(Seattle, 700, 50, 200, 200*Seattle.height/Seattle.width);
    }
  } 
  else {
    seattle = 20;
  }

  //birmingham, AL
  //300  October  15 2011
  if (modX > 687 && modX < 707) {
    if (modY > 479 && modY < 499) {
      birmingham = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Birmingham, Alabama", 400, 110);
      text("Avg. People 300", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    birmingham = 20;
  }

  //lousville, KE
  //300 October 4 2011
  if (modX > 697 && modX < 717) {
    if (modY > 402 && modY < 412) {
      louisville = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Louisville, Kentucky", 400, 110);
      text("Avg. People 300", 400, 130);
      text("Start Date: October 4,2011", 400, 150);
    }
  } 
  else {
    louisville = 20;
  }

  //boston, MA
  //10,000  September 30,2011
  if (modX > 905 && modX < 925) {
    if (modY > 278 && modY < 298) {
      boston = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Boston, Massachusetts", 400, 110);
      text("Avg. People 10,000", 400, 130);
      text("Start Date: September 30,2011", 400, 150);
        image(bostonimg, 700, 50, 200, 200*bostonimg.height/bostonimg.width);
    }
  } 
  else {
    boston = 20;
  }

  //NYC, NY
  // 30,000  September 17,2011
  if (modX > 855 && modX < 875) {
    if (modY > 274 && modY < 294) {
      NYC = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("New York City, New York", 400, 110);
      text("Avg. People 30,000", 400, 130);
      text("Start Date: September 17,2011", 400, 150);
        image(newyorkimg, 700, 50, 200, 200*newyorkimg.height/newyorkimg.width);
    }
  } 
  else {
    NYC = 20;
  }


  //wilmington, DE
  //150 November 13, 2011
  if (modX > 854 && modX < 874) {
    if (modY > 365 && modY < 385) {
      wilmington = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Wilmington, Deleware", 400, 110);
      text("Avg. People 150", 400, 130);
      text("Start Date: October 13,2011", 400, 150);
    }
  } 
  else {
    wilmington = 20;
  }

  //casper, WY
  //50  October 8 2011
  if (modX > 390 && modX < 410) {
    if (modY > 307 && modY < 327) {
      casper = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Casper, Wyoming", 400, 110);
      text("Avg. People 50", 400, 130);
      text("Start Date: October 8,2011", 400, 150);
    }
  } 
  else {
    casper = 20;
  }

  //tallahassee, FL
  //150 October 6 2011
  if (modX > 754 && modX < 774) {
    if (modY > 545 && modY < 565) {
      tallahassee = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Tallahassee, Florida", 400, 110);
      text("Avg. People 150", 400, 130);
      text("Start Date: October 6,2011", 400, 150);
    }
  } 
  else {
    tallahassee = 20;
  }

  //chicago, IL
  //8,000 September 24, 2011
  if (modX > 662 && modX < 682) {
    if (modY > 332 && modY < 352) {
      chicago = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Chicago, Illinois", 400, 110);
      text("Avg. People 8,000", 400, 130);
      text("Start Date: September 24,2011", 400, 150);
        image(chicagoimg, 700, 50, 200, 200*chicagoimg.height/chicagoimg.width);
    }
  } 
  else {
    chicago = 20;
  }

  //indianapolis, IN
  //1,000  October 8,2011
  if (modX > 693 && modX < 713) {
    if (modY > 653 && modY < 373) {
      indianapolis = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Indianapolis, Indiana", 400, 110);
      text("Avg. People 1,000", 400, 130);
      text("Start Date: October 8,2011", 400, 150);
    }
  } 
  else {
    indianapolis = 20;
  }

  //park city, UT
  //  40  October 31, 2011
  if (modX > 336 && modX < 356) {
    if (modY > 338 && modY < 358) {
      parkcity = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Park City, Utah", 400, 110);
      text("Avg. People 40", 400, 130);
      text("Start Date: October 31,2011", 400, 150);
    }
  } 
  else {
    parkcity = 20;
  }

  //pheonix, AR
  //1,000  October  14 2011
  if (modX > 298 && modX < 318) {
    if (modY > 480 && modY < 500) {
      pheonix = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Arizona, Pheonix", 400, 110);
      text("Avg. People 1,000", 400, 130);
      text("Start Date: October 14,2011", 400, 150);
        image(phoenix, 700, 50, 200, 200*phoenix.height/phoenix.width);
    }
  } 
  else {
    pheonix = 20;
  }

  //carson city, NV
  //70 October 15 2011
  if (modX > 208 && modX < 228) {
    if (modY > 344 && modY < 364) {
      carsoncity = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Carson City, Nevada", 400, 110);
      text("Avg. People 70", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    carsoncity = 20;
  }

  //sioux falls, SD
  //50 October 15 2011
  if (modX > 537 && modX < 557) {
    if (modY > 303 && modY < 323) {
      siouxfalls = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Sioux Falls, South Dakota", 400, 110);
      text("Avg. People 50", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    siouxfalls = 20;
  }

  //rapid city, SD
  //50  October, 15 2011
  if (modX > 450 && modX < 470) {
    if (modY > 290 && modY < 310) {
      rapidcity = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Rapid City, South Dakota", 400, 110);
      text("Avg. People 50", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    rapidcity = 20;
  }

  //oklahoma city, OK
  //100 October 10 2011
  if (modX > 527 && modX < 547) {
    if (modY > 447 && modY < 467) {
      oklahomacity = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Oklahoma City, Oklahoma", 400, 110);
      text("Avg. People 100", 400, 130);
      text("Start Date: October 10,2011", 400, 150);
    }
  } 
  else {
    oklahomacity = 20;
  }

  //fort worth, TX
  //200  October 10 2011
  if (modX > 523 && modX < 543) {
    if (modY > 503 && modY < 523) {
      fortworth = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Fort Worth, Texas", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 10,2011", 400, 150);
    }
  } 
  else {
    fortworth = 20;
  }

  //san antonio, TX
  //200 October 3 2011
  if (modX > 504 && modX < 524) {
    if (modY > 569 && modY < 589) {
      sanantonio = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("San Antonio, Texas", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 3,2011", 400, 150);
    }
  } 
  else {
    sanantonio = 20;
  }

  //little rock, AS
  // 400 October  15 2011
  if (modX > 608 && modX < 628) {
    if (modY > 465 && modY < 485) {
      littlerock = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Little Rock, Arkansas", 400, 110);
      text("Avg. People 400", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    littlerock = 20;
  }

  //burlington, VT
  //1,000 October  9,2011
  if (modX > 862 && modX < 882) {
    if (modY > 252 && modY < 272) {
      burlington = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Burlington, Vermont", 400, 110);
      text("Avg. People 1,000", 400, 130);
      text("Start Date: October 9,2011", 400, 150);
    }
  } 
  else {
    burlington = 20;
  }

  //baton rouge, LO
  //120  October 24, 2011
  if (modX > 623 && modX < 643) {
    if (modY > 547 && modY < 567) {
      batonrouge = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Baton Rouge, Louisiana", 400, 110);
      text("Avg. People 120", 400, 130);
      text("Start Date: October 24,2011", 400, 150);
    }
  } 
  else {
    batonrouge = 20;
  }


  //jackson, MI
  //50  October 15, 2011
  if (modX > 638 && modX < 648) {
    if (modY > 515 && modY < 535) {
      jackson = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Jackson, Mississippi", 400, 110);
      text("Avg. People 50", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    jackson = 20;
  }


  //hanover, NH
  //20  October 13, 2011
  if (modX > 882 && modX < 902) {
    if (modY > 246 && modY < 266) {
      hanover = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Hanover, New Hampshire", 400, 110);
      text("Avg. People 20", 400, 130);
      text("Start Date: October 13,2011", 400, 150);
    }
  } 
  else {
    hanover = 20;
  }

  //richmond, VG
  // 200 ppl October 15 2011
  if (modX > 842 && modX < 862) {
    if (modY > 386 && modY < 406) {
      richmond = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Richmond, Virginia", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    richmond = 20;
  }


  //hilton head, SC
  //12 ppl December 29, 2011
  if (modX > 794 && modX < 814) {
    if (modY > 486 && modY < 506) {
      hiltonhead = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("HiltonHead, South Carolina", 400, 110);
      text("Avg. People 12", 400, 130);
      text("Start Date: December 29,2011", 400, 150);
    }
  } 
  else {
    hiltonhead = 20;
  }


  //huntington, WV
  // 100  October 9 2011
  if (modX > 754 && modX < 774) {
    if (modY > 389 && modY < 409) {
      huntington = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Huntington, West Virginia", 400, 110);
      text("Avg. People 100", 400, 130);
      text("Start Date: October 9,2011", 400, 150);
    }
  } 
  else {
    huntington = 20;
  }


  //martinsburg, WV\
  //100  October 15 2011
  if (modX > 803 && modX < 820) {
    if (modY > 362 && modY < 382) {
      martinsburg = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Marinsburg, West Virginia", 400, 110);
      text("Avg. People 100", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    martinsburg = 20;
  }


  //cleveland, OH
  //150 October 6 2011
  if (modX > 763 && modX < 783) {
    if (modY > 329 && modY < 349) {
      cleveland = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Cleveland, Ohio", 400, 110);
      text("Avg. People 150", 400, 130);
      text("Start Date: October 6,2011", 400, 150);
    }
  } 
  else {
    cleveland = 20;
  }


  //DC, (disctrict of columbia)
  //3,000  October 1,2011
  if (modX > 828 && modX < 848) {
    if (modY > 361 && modY < 381) {
      DC = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("District of Colombia", 400, 110);
      text("Avg. People 3,000", 400, 130);
      text("Start Date: October 1,2011", 400, 150);
        image(DCimg, 700, 50, 200, 200*DCimg.height/DCimg.width);
    }
  } 
  else {
    DC = 20;
  }


  //jackson, MI
  //50  October 15, 2011
  if (modX > 693 && modX < 713) {
    if (modY > 353 && modY < 373) {
      indianapolis = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Jackson, Mississippi", 400, 110);
      text("Avg. People 50", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    indianapolis = 20;
  }


  //pittsburgh, PN
  //2,000  October  16,2011
  if (modX > 782 && modX < 802) {
    if (modY > 344 && modY < 364) {
      pittsburg = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Pittsburgh, Pennsylvania", 400, 110);
      text("Avg. People 2,000", 400, 130);
      text("Start Date: October 16,2011", 400, 150);
    }
  } 
  else {
    pittsburg = 20;
  }

  //greensboro, NC
  //600  October  15 2011
  if (modX > 784 && modX < 804) {
    if (modY > 432 && modY < 452) {
      greensboro = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Greensboro, North Carolina", 400, 110);
      text("Avg. People 600", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    greensboro = 20;
  }

  //madison, WS
  //200  October 7 2011
  if (modX > 646 && modX < 666) {
    if (modY > 305 && modY < 325) {
      madison = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Madison, Wisconsin", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 7,2011", 400, 150);
    }
  } 
  else {
    madison = 20;
  }

  //milwaukee, WS
  //1,000 October 15,2011
  if (modX > 664 && modX < 684) {
    if (modY > 313 && modY < 333) {
      milwaukee = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Wilwaukee, Wisconsin", 400, 110);
      text("Avg. People 1,000", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    milwaukee = 20;
  }

  //grand rapis, MI
  //350  October 8 2011
  if (modX > 694 && modX <714 ) {
    if (modY > 308 && modY < 328) {
      grandrapids = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Grand Rapids, Michigan", 400, 110);
      text("Avg. People3000", 400, 130);
      text("Start Date: October 8,2011", 400, 150);
    }
  } 
  else {
    grandrapids = 20;
  }

  //lansing, MI
  //350  October 8 2011
  if (modX > 713 && modX < 733) {
    if (modY > 300 && modY < 320) {
      lansing = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Lansing, Michigan", 400, 110);
      text("Avg. People 350", 400, 130);
      text("Start Date: October 8,2011", 400, 150);
    }
  } 
  else {
    lansing = 20;
  }

  //syracuse, NY
  if (modX > 825 && modX < 845) {
    if (modY > 269 && modY < 289) {
      syracuse = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Syracuse, New York", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 2,2011", 400, 150);
    }
  } 
  else {
    syracuse = 20;
  }

  //buffalo, NY
  if (modX > 796 && modX < 816) {
    if (modY > 284 && modY < 304) {
      buffalo = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Buffalo, New York", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 1,2011", 400, 150);
    }
  } 
  else {
    buffalo = 20;
  }

  //Harrisburg, PN
  if (modX > 831 && modX < 851) {
    if (modY > 336 && modY < 356) {
      harrisburg = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Harrisburg, Pennsylvania", 400, 110);
      text("Avg. People 100", 400, 130);
      text("Start Date: October 15,2011", 400, 150);
    }
  } 
  else {
    harrisburg = 20;
  }

  //Atlantic City
  if (modX > 860 && modX < 880) {
    if (modY > 348 && modY < 368) {
      atlanticcity = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Atlantic City", 400, 110);
      text("Avg. People 53", 400, 130);
      text("Start Date: November 5,2011", 400, 150);
    }
  } 
  else {
    atlanticcity = 20;
  }
  //Charlottesville
  if (modX > 820 && modX < 840) {
    if (modY > 375 && modY < 395) {
      charlotsville = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Charlottesville, Virginia", 400, 110);
      text("Avg. People 120", 400, 130);
      text("Start Date: Octover 15,2011", 400, 150);
    }
  } 
  else {
    charlotsville = 20;
  }

  //baltimore
  if (modX > 834 && modX < 853) {
    if (modY > 353 && modY < 395) {
      baltimore = 100;
      fill(0);
      textFont(font);
      textSize(17);
      text("Baltimore, Maryland", 400, 110);
      text("Avg. People 200", 400, 130);
      text("Start Date: October 3,2011", 400, 150);
    
    }
  } 
  else {
    baltimore = 20;
  }
}









