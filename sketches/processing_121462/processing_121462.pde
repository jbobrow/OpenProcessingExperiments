
PImage worldMap; //image from outline-world-map.com 
PImage usMap;
PImage ukMap;
PImage ussrMap;
PImage chinaMap;
PImage franceMap;
PImage indiaMap;
PImage pakistanMap;

float day = 171; //day # of the current year.  Starts 26 days before the trinity test   
int year = 45; //year #.  Starts at 45 for 1945
float nukeSize = 40;
float flashTime = 15;

int flashCount = 0;

color usCol = color(random(0, 255), random(0, 255), random(0, 255));
color ukCol = color(random(0, 255), random(0, 255), random(0, 255));
color ussrCol = color(random(0, 255), random(0, 255), random(0, 255));
color chinaCol = color(random(0, 255), random(0, 255), random(0, 255));
color franceCol = color(random(0, 255), random(0, 255), random(0, 255));
color indiaCol = color(random(0, 255), random(0, 255), random(0, 255));
color pakistanCol = color(random(0, 255), random(0, 255), random(0, 255));

boolean isFlashing = false;

Country[] c = new Country[7];


void setup() 
{
  worldMap = loadImage("worldMap3.gif"); //find the image
  image(worldMap, 0, 0); // draw the map

  usMap = loadImage("US.png");
  ukMap = loadImage("UK.png");
  ussrMap = loadImage("USSR.png");
  chinaMap = loadImage("China.png");
  franceMap = loadImage("France.png");
  indiaMap = loadImage("India.png");
  pakistanMap = loadImage("Pakistan.png");

  c[0] = new Country(usMap, 184, 127, usCol);
  c[1] = new Country(ukMap, 577, 96, ukCol);
  c[2] = new Country(ussrMap, 689, 31, ussrCol);
  c[3] = new Country(chinaMap, 842, 114, chinaCol);
  c[4] = new Country(franceMap, 582, 122, franceCol);
  c[5] = new Country(indiaMap, 826, 182, indiaCol);
  c[6] = new Country(pakistanMap, 802, 166, pakistanCol);

  size(1196, 600);
  background(worldMap);

  frameRate(60); //lock frame rate
  // myNuke = new Nuke(10, 250, 250, usaColor);
}

void draw()
{

  count();
  explode();

  println (day);
  println (year);

  if (isFlashing == true && (flashCount < flashTime)) {
    flashCount++;
  }

  else if (isFlashing == true && (flashCount == flashTime)) {
    flashCount = 0;
    isFlashing = false;
    for (int i = 0; i < c.length; i++)  c[i].reset();
  }
}

void count()
{
  day += 2; //constantly add to dayCount
  if (day == 365) {
    year ++;
    day = 1;
  }
}


class Country {

  PImage image;
  int xPos;
  int yPos;
  color col;

  Country(PImage tempImage, int tempXPos, int tempYPos, color tempCol) {
    image = tempImage;
    xPos = tempXPos;
    yPos = tempYPos;
    col = tempCol;
  }

  void flash() {
    tint(col);
    image(image, xPos, yPos);
    isFlashing = true;
  }

  void reset() {
    tint(255);
    image(image, xPos, yPos);
  }
}

void explode()
{
  if (year == 45)                                       //c.[0] = USA
  {                                                     //c.[1] = UK
    if (day == 197) c[0].flash();                       //c.[2] = USSR 
    if (day == 217) c[0].flash();                       //c.[3] = China
    if (day == 221) c[0].flash();                       //c.[4] = France
  }                                                     //c.[5] = India
  //c.[6] = Pakistan
  if (year == 46)                                       
  {
    if (day == 181) c[0].flash();
    if (day == 205) c[0].flash();
  }

  if (year == 47)
  {
  }

  if (year == 48)
  {
    if (day == 105) c[0].flash();
    if (day == 121) c[0].flash();
    if (day == 135) c[0].flash();
  }

  if (year == 49)
  {
    if (day == 241) c[2].flash();
  }

  if (year == 50)
  {
  }

  if (year == 51)
  {
    if (day == 27) c[0].flash();
    if (day == 29) c[0].flash();
    if (day == 31) c[0].flash();
    if (day == 33) c[0].flash();
    if (day == 37) c[0].flash();
    if (day == 97) c[0].flash();
    if (day == 111) c[0].flash();
    if (day == 129) c[0].flash();
    if (day == 145) c[0].flash();
    if (day == 267) c[2].flash();
    if (day == 291) c[2].flash();
    if (day == 295) c[0].flash();
    if (day == 301) c[0].flash();
    if (day == 303) c[0].flash();
    if (day == 305) c[0].flash();
    if (day == 309) c[0].flash();
    if (day == 323) c[0].flash();
    if (day == 333) c[0].flash();
  }

  if (year == 52)
  {
    if (day == 93) c[0].flash();
    if (day == 106) c[0].flash();
    if (day == 113) c[0].flash();
    if (day == 123) c[0].flash();
    if (day == 129) c[0].flash();
    if (day == 147) c[0].flash();
    if (day == 153) c[0].flash();
    if (day == 157) c[0].flash();
    if (day == 277) c[1].flash();
    if (day == 305) c[0].flash();
    if (day == 321) c[0].flash();
  }

  if (year == 53)
  {
    if (day == 77) c[0].flash();
    if (day == 83) c[0].flash();
    if (day == 91) c[0].flash();
    if (day == 97) c[0].flash();
    if (day == 101) c[0].flash();
    if (day == 109) c[0].flash();
    if (day == 115) c[0].flash();
    if (day == 129) c[0].flash();
    if (day == 139) c[0].flash();
    if (day == 145) c[0].flash();
    if (day == 155) c[0].flash();
    if (day == 225) c[2].flash();
    if (day == 235) c[2].flash();
    if (day == 247) c[2].flash();
    if (day == 251) c[2].flash();
    if (day == 253) c[2].flash();
    if (day == 287) c[1].flash();
    if (day == 291) c[1].flash();
  }

  if (year == 54)
  {
    if (day == 59) c[0].flash();
    if (day == 85) c[0].flash();
    if (day == 97) c[0].flash();
    if (day == 115) c[0].flash();
    if (day == 125) c[0].flash();
    if (day == 133) c[0].flash();
    if (day == 257) c[2].flash();
    if (day == 273) c[2].flash();
    if (day == 275) c[2].flash();
    if (day == 277) c[2].flash();
    if (day == 279) c[2].flash();
    if (day == 281) c[2].flash();
    if (day == 293) c[2].flash();
    if (day == 297) c[2].flash();
    if (day == 299) c[2].flash();
    if (day == 303) c[2].flash();
  }

  if (year == 55)
  {
    if (day == 49) c[0].flash();
    if (day == 53) c[0].flash();
    if (day == 61) c[0].flash();
    if (day == 67) c[0].flash();
    if (day == 71) c[0].flash();
    if (day == 81) c[0].flash();
    if (day == 83) c[0].flash();
    if (day == 89) c[0].flash();
    if (day == 89) c[0].flash();
    if (day == 97) c[0].flash();
    if (day == 99) c[0].flash();
    if (day == 105) c[0].flash();
    if (day == 125) c[0].flash();
    if (day == 133) c[0].flash();
    if (day == 135) c[0].flash();
    if (day == 210) c[2].flash();
    if (day == 215) c[2].flash();
    if (day == 217) c[2].flash();
    if (day == 265) c[2].flash();
    if (day == 305) c[0].flash();
    if (day == 307) c[0].flash();
    if (day == 309) c[0].flash();
    if (day == 311) c[2].flash();
    if (day == 327) c[2].flash();
  }

  if (year == 56)
  {
    if (day == 18) c[0].flash();
    if (day == 33) c[2].flash();
    if (day == 77) c[2].flash();
    if (day == 85) c[2].flash();
    if (day == 125) c[0].flash();
    if (day == 137) c[1].flash();
    if (day == 141) c[0].flash();
    if (day == 149) c[0].flash();
    if (day == 149) c[0].flash();
    if (day == 151) c[0].flash();
    if (day == 159) c[0].flash();
    if (day == 163) c[0].flash();
    if (day == 163) c[0].flash();
    if (day == 165) c[0].flash();
    if (day == 169) c[0].flash();
    if (day == 171) c[1].flash();
    if (day == 173) c[0].flash();
    if (day == 177) c[0].flash();
    if (day == 185) c[0].flash();
    if (day == 191) c[0].flash();
    if (day == 193) c[0].flash();
    if (day == 201) c[0].flash();
    if (day == 203) c[0].flash();
    if (day == 237) c[2].flash();
    if (day == 243) c[2].flash();
    if (day == 247) c[2].flash();
    if (day == 255) c[2].flash();
    if (day == 271) c[1].flash();
    if (day == 279) c[1].flash();
    if (day == 285) c[1].flash();
    if (day == 297) c[1].flash();
    if (day == 323) c[2].flash();
    if (day == 15) c[2].flash();
  }

  if (year == 57)
  {
    if (day == 19) c[2].flash();
    if (day == 67) c[2].flash();
    if (day == 95) c[2].flash();
    if (day == 97) c[2].flash();
    if (day == 101) c[2].flash();
    if (day == 103) c[2].flash();
    if (day == 107) c[2].flash();
    if (day == 114) c[0].flash();
    if (day == 115) c[1].flash();
    if (day == 149) c[0].flash();
    if (day == 151) c[1].flash();
    if (day == 153) c[0].flash();
    if (day == 157) c[0].flash();
    if (day == 169) c[0].flash();
    if (day == 171) c[1].flash();
    if (day == 175) c[0].flash();
    if (day == 183) c[0].flash();
    if (day == 187) c[0].flash();
    if (day == 197) c[0].flash();
    if (day == 201) c[0].flash();
    if (day == 203) c[0].flash();
    if (day == 205) c[0].flash();
    if (day == 207) c[0].flash();
    if (day == 219) c[0].flash();
    if (day == 223) c[0].flash();
    if (day == 257) c[1].flash();
    if (day == 231) c[0].flash();
    if (day == 235) c[0].flash();
    if (day == 235) c[2].flash();
    if (day == 239) c[0].flash();
    if (day == 239) c[2].flash();
    if (day == 241) c[0].flash();
    if (day == 243) c[0].flash();
    if (day == 245) c[0].flash();
    if (day == 249) c[0].flash();
    if (day == 249) c[0].flash();
    if (day == 251) c[0].flash();
    if (day == 251) c[2].flash();
    if (day == 257) c[0].flash();
    if (day == 257) c[2].flash();
    if (day == 259) c[0].flash();
    if (day == 263) c[0].flash();
    if (day == 267) c[2].flash();
    if (day == 267) c[0].flash();
    if (day == 269) c[1].flash();
    if (day == 269) c[2].flash();
    if (day == 271) c[0].flash();
    if (day == 279) c[2].flash();
    if (day == 281) c[0].flash();
    if (day == 283) c[1].flash();
    if (day == 283) c[2].flash();
    if (day == 313) c[1].flash();
    if (day == 341) c[0].flash();
    if (day == 343) c[0].flash();
    if (day == 363) c[2].flash();
  }

  if (year == 58)
  {
    if (day == 4) c[2].flash();
    if (day == 17) c[2].flash();
    if (day == 53) c[0].flash();
    if (day == 55) c[2].flash();
    if (day == 59) c[2].flash();
    if (day == 59) c[2].flash();
    if (day == 71) c[2].flash();
    if (day == 73) c[0].flash();
    if (day == 73) c[2].flash();
    if (day == 73) c[2].flash();
    if (day == 75) c[2].flash();
    if (day == 77) c[2].flash();
    if (day == 79) c[2].flash();
    if (day == 79) c[2].flash();
    if (day == 81) c[2].flash();
    if (day == 118) c[0].flash();
    if (day == 119) c[1].flash();
    if (day == 125) c[0].flash();
    if (day == 131) c[0].flash();
    if (day == 131) c[0].flash();
    if (day == 133) c[0].flash();
    if (day == 137) c[0].flash();
    if (day == 139) c[0].flash();
    if (day == 141) c[0].flash();
    if (day == 147) c[0].flash();
    if (day == 147) c[0].flash();
    if (day == 149) c[0].flash();
    if (day == 151) c[0].flash();
    if (day == 153) c[0].flash();
    if (day == 159) c[0].flash();
    if (day == 161) c[0].flash();
    if (day == 165) c[0].flash();
    if (day == 165) c[0].flash();
    if (day == 169) c[0].flash();
    if (day == 177) c[0].flash();
    if (day == 177) c[0].flash();
    if (day == 179) c[0].flash();
    if (day == 181) c[0].flash();
    if (day == 181) c[0].flash();
    if (day == 183) c[0].flash();
    if (day == 187) c[0].flash();
    if (day == 193) c[0].flash();
    if (day == 195) c[0].flash();
    if (day == 199) c[0].flash();
    if (day == 203) c[0].flash();
    if (day == 203) c[0].flash();
    if (day == 207) c[0].flash();
    if (day == 213) c[0].flash();
    if (day == 219) c[0].flash();
    if (day == 225) c[0].flash();
    if (day == 231) c[0].flash();
    if (day == 235) c[1].flash();
    if (day == 239) c[0].flash();
    if (day == 243) c[0].flash();
    if (day == 245) c[1].flash();
    if (day == 249) c[0].flash();
    if (day == 255) c[1].flash();
    if (day == 255) c[0].flash();
    if (day == 261) c[0].flash();
    if (day == 263) c[0].flash();
    if (day == 265) c[0].flash();
    if (day == 267) c[0].flash();
    if (day == 267) c[1].flash();
    if (day == 269) c[0].flash();
    if (day == 271) c[0].flash();
    if (day == 273) c[0].flash();
    if (day == 273) c[2].flash();
    if (day == 273) c[2].flash();
    if (day == 275) c[2].flash();
    if (day == 275) c[2].flash();
    if (day == 277) c[2].flash();
    if (day == 279) c[0].flash();
    if (day == 279) c[0].flash();
    if (day == 279) c[2].flash();
    if (day == 279) c[2].flash();
    if (day == 281) c[0].flash();
    if (day == 283) c[0].flash();
    if (day == 283) c[2].flash();
    if (day == 285) c[2].flash();
    if (day == 285) c[0].flash();
    if (day == 287) c[0].flash();
    if (day == 287) c[0].flash();
    if (day == 289) c[2].flash();
    if (day == 289) c[0].flash();
    if (day == 289) c[0].flash();
    if (day == 289) c[0].flash();
    if (day == 291) c[2].flash();
    if (day == 291) c[0].flash();
    if (day == 293) c[2].flash();
    if (day == 293) c[2].flash();
    if (day == 293) c[2].flash();
    if (day == 293) c[0].flash();
    if (day == 295) c[0].flash();
    if (day == 295) c[0].flash();
    if (day == 295) c[0].flash();
    if (day == 295) c[0].flash();
    if (day == 295) c[2].flash();
    if (day == 295) c[2].flash();
    if (day == 297) c[2].flash();
    if (day == 297) c[0].flash();
    if (day == 297) c[0].flash();
    if (day == 299) c[0].flash();
    if (day == 299) c[0].flash();
    if (day == 299) c[0].flash();
    if (day == 299) c[2].flash();
    if (day == 299) c[2].flash();
    if (day == 301) c[0].flash();
    if (day == 301) c[0].flash();
    if (day == 301) c[0].flash();
    if (day == 301) c[0].flash();
    if (day == 303) c[0].flash();
    if (day == 303) c[0].flash();
    if (day == 303) c[0].flash();
    if (day == 303) c[0].flash();
    if (day == 305) c[2].flash();
    if (day == 307) c[2].flash();
  }

  if (year == 59)
  {
  }

  if (year == 60)
  {
    if (day == 45) c[4].flash();
    if (day == 93) c[4].flash();
    if (day == 363) c[4].flash();
  }

  if (year == 61)
  {
  }

  if (year == 62)
  {
  }

  if (year == 63)
  {
  }

  if (year == 64)
  {
  }

  if (year == 65)
  {
  }

  if (year == 66)
  {
  }

  if (year == 67)
  {
  }

  if (year == 68)
  {
  }

  if (year == 69)
  {
  }

  if (year == 70)
  {
  }

  if (year == 71)
  {
  }

  if (year == 72)
  {
  }

  if (year == 73)
  {
  }

  if (year == 74)
  {
  }

  if (year == 75)
  {
  }

  if (year == 76)
  {
  }

  if (year == 77)
  {
  }

  if (year == 78)
  {
  }

  if (year == 79)
  {
  }

  if (year == 80)
  {
  }
}



