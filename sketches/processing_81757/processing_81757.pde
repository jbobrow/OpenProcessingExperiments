
// Music Chart Program
String topallsong = "";
String topallartist = "";
String countryartist = "";
String countrysong = "";
String ukartist = "";
String uk1song = "";
String dancesong = "";
String danceartist = "";

PImage b;
PImage Logo;
PImage Top10uk;
PImage Topdance;
PImage Top10all;
//PFont font;
PImage genretitle;
PImage tunes;
PImage rock;
PImage country;


void setup(){
  size (700,700);
  noStroke();
 
 b = loadImage("musicnote.jpg");
 background (255,255,255);
 
  genretitle = loadImage("genretitle.jpg");
  smooth(); 
  Logo = loadImage("logo.jpg");
  smooth(); 
  tunes = loadImage("tunes.jpg");
  smooth();
  Top10all = loadImage("top10all.png");
  smooth();
  Top10uk = loadImage("top10.png");
  smooth();
  Topdance = loadImage("topdance.png");
  smooth();
  genretitle = loadImage("genretitle.jpg");
  smooth();
  rock = loadImage("toprock.png");
  smooth();
 country = loadImage ("topcountry.png");
 
 
 getData();
}


void draw() {
          

  image (Logo, 0, 0, width, height/4) ;
  image (tunes, 275, 160);
  image (Top10uk, 50, 300);
  image (Topdance, 50,400);
  image (Top10all,50,500);
  image (country, 50, 600);
  
  fill(0);  
text (topallsong, 250, 550);
text (topallartist, 450, 550);
text (countryartist, 450, 650);
text (countrysong, 250, 650);
text (ukartist, 450, 350);
text (uk1song, 250, 350);
text (dancesong, 250, 450);
text (danceartist, 450, 450);
}


void getData(){
{
String[] ln = loadStrings("http://en.wikipedia.org/wiki/UK_Singles_Chart");
String pg= " ";
for (int i=0; i<ln.length;i++) {
 pg= pg + ln[i];
}
String[] bits = split(pg,"<td>\"<a href=\"/wiki/Candle_in_the_Wind_1997\" title=\"");
String[] topallsongBit = split (bits[1], "\">Candle in the Wind 1997</a>");
println(trim(topallsongBit[0]));
topallsong = topallsongBit[0];
}
{
String[] ln = loadStrings("http://en.wikipedia.org/wiki/UK_Singles_Chart");
 String pg= " ";
for (int i=0; i<ln.length;i++) {
 pg= pg + ln[i];
}
String[] bits = split(pg,"<td><a href=\"/wiki/");
String[] topallArtistBit = split (bits[1], "\" title=\"Elton John\">Elton John</a></td>");
println(trim(topallArtistBit[0]));
topallartist = topallArtistBit[0];
}

{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10countryalbums.html");
String wholePage="";
 
 String pg= " ";
for (int i=0; i<ln.length;i++) {
 pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/red/id571631959?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>Red</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/taylor-swift/id159260351?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>");
String[] countryartistBit = split(bit[1], "</span></a></li>");
println(trim(countryartistBit[0]));
countryartist = countryartistBit[0];
}
{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10countryalbums.html");
String wholePage="";
String pg= " ";
for (int i=0; i<ln.length;i++) {
 pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/red-deluxe-version/id571637824?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>Red (Deluxe Version)</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/taylor-swift/id159260351?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>Taylor Swift</span></a><br /><a href=\"https://itunes.apple.com/gb/album/red-deluxe-version/id571637824?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><img src=\"http://a599.phobos.apple.com/us/r2000/016/Music/v4/46/55/09/465509be-1cb3-8b41-3282-99ef5f73e92d/12UMGIM54089.60x60-50.jpg\" width=\"60\" height=\"60\" alt=\"");
String[] countrysongBit = split(bit[1], "\" style=\"padding-top: 3px; border: 0;\" /></a></li>");
println(trim(countrysongBit[0]));
countrysong = countrysongBit[0];
}

{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10songs.html");
String wholePage="";
String pg= " ";
for (int i=0; i<ln.length;i++) {
 pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/locked-out-of-heaven/id566150419?i=566150448&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>Locked Out of Heaven</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/bruno-mars/id278873078?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>");
String[] uk1artistBit = split(bit[1], "</span></a><br /><a href=\"https://itunes.apple.com/gb/album/locked-out-of-heaven/id566150419?i=566150448&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><img src=\"http://a386.phobos.apple.com/us/r1000/100/Music/v4/53/50/aa/5350aa5a-565f-1410-a9ee-aaac3a97ea4f/075679957849.60x60-50.jpg\" width=\"60\" height=\"60\" alt=\"Locked Out of Heaven\" style=\"padding-top: 3px; border: 0;\" /></a></li>");
println(trim(uk1artistBit[0]));
ukartist = uk1artistBit[0];

}

{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10songs.html");
String wholePage="";
 String pg= " ";
for (int i=0; i<ln.length;i++) {
  pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/locked-out-of-heaven/id566150419?i=566150448&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>");
String[] uk1songBit = split(bit[1], "</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/bruno-mars/id278873078?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>Bruno Mars</span></a><br /><a href=\"https://itunes.apple.com/gb/album/locked-out-of-heaven/id566150419?i=566150448&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><img src=\"http://a386.phobos.apple.com/us/r1000/100/Music/v4/53/50/aa/5350aa5a-565f-1410-a9ee-aaac3a97ea4f/075679957849.60x60-50.jpg\" width=\"60\" height=\"60\" alt=\"Locked Out of Heaven\" style=\"padding-top: 3px; border: 0;\" /></a></li>");
println(trim(uk1songBit[0]));
uk1song = uk1songBit[0];
}

{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10dancesongs.html");
String wholePage=""; 
 String pg= " ";
for (int i=0; i<ln.length;i++) {
pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/not-giving-in/id567179355?i=567179540&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>");
String[] dancesongBit = split(bit[1], "</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/rudimental/id474022504?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>Rudimental</span></a><br /><a href=\"https://itunes.apple.com/gb/album/not-giving-in/id567179355?i=567179540&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><img src=\"http://a320.phobos.apple.com/us/r1000/094/Features/v4/78/1b/6b/781b6b4e-7b62-e039-97cc-8a8b1583a8dd/dj.rvedjmge.60x60-50.jpg\" width=\"60\" height=\"60\" alt=\"Not Giving In\" style=\"padding-top: 3px; border: 0;\" /></a></li>");
println(trim(dancesongBit[0]));

dancesong = dancesongBit[0];
}
{
String[] ln = loadStrings("http://www.apple.com/euro/itunes/charts/top10dancesongs.html");
String wholePage="";
String pg= " ";
for (int i=0; i<ln.length;i++) {
pg= pg + ln[i];
}
String[] bit = split(pg, "<li><a href=\"https://itunes.apple.com/gb/album/not-giving-in/id567179355?i=567179540&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><strong>Not Giving In</strong></a><br /><a href=\"http://itunes.apple.com/gb/artist/rudimental/id474022504?uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><span>");
String[] danceartistBit = split(bit[1], "</span></a><br /><a href=\"https://itunes.apple.com/gb/album/not-giving-in/id567179355?i=567179540&amp;uo=2&amp;v0=WWW-EUUK-ITUHOME-TOPMUSIC\"><img src=\"http://a320.phobos.apple.com/us/r1000/094/Features/v4/78/1b/6b/781b6b4e-7b62-e039-97cc-8a8b1583a8dd/dj.rvedjmge.60x60-50.jpg\" width=\"60\" height=\"60\" alt=\"Not Giving In\" style=\"padding-top: 3px; border: 0;\" /></a></li>");
println(trim(danceartistBit[0]));

danceartist = danceartistBit[0];
}
}

