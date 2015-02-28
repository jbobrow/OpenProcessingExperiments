
boolean startScreen = true, listChoice = false, mapChoice = false;
void setup(){
  
  size(508,397);
}

void draw(){
  
  if(startScreen){
    background(#FCB90D);
    PImage b;
    b = loadImage("rsz_asiamap.png");
    image(b, 279, 150);
     text("How do you want to display the times?",150, 100);
    fill(#FFFFFF);
    rect(125, 150, 129, 99);
    fill(#FF080C);
    text("List ", 180,140);
    fill(0);
    line(130,160,250, 160);
    line(130,170,250, 170);
    line(130,180,250, 180);
    line(130,190,250, 190);
    line(130,200,250, 200);
    line(130,210,250, 210);
    line(130,220,250, 220);
    line(130,230,250, 230);
    line(130,240,250, 240);
       
    fill(#FFFFFF);
    fill(#FF080C);
    text("Map", 330,140);
    
    if((mousePressed) && (mouseX <257) && (mouseX >125) && (mouseY > 130) && (mouseY <249)){
     listChoice = true; 
     startScreen = false;
    }
    
     if((mousePressed) && (mouseX <406) && (mouseX >279) && (mouseY > 130) && (mouseY <249)){
     mapChoice = true; 
     startScreen = false;
    }
  }
    
  if(listChoice){
  background(50);
  fill(#FFFFFF);
  text("<< Back", 450, 15);
     if((mouseX <508) && (mouseX >450) &&(mouseY <25) && (mousePressed)){
    listChoice = false;
    startScreen = true;
  
  }
  beijing();
  incheon();
  taipei();
  shanghai();
  hongKong();
  tokyo();
  hangzhou();
  singapore(); 
  kualaLumpur();
  jakarta();
  bangkok();

  }
  
  if(mapChoice){
    PImage b;
    b = loadImage("asiaMap.png");
    image(b, 0, 0);
    
    text("<< Back", 450, 15);
     if((mouseX <508) && (mouseX >450) &&(mouseY <25) && (mousePressed)){
    startScreen = true;
    mapChoice = false;
  }
    smooth();
    strokeWeight(8);
    point(360,170);
    point(394,173);
    point(390, 240);
    point(364, 244);
    point(380, 204);
    point(376, 210);
    point(450, 180);
    point(320, 330);
    point(327, 338);
    point(350, 380);
    point(315, 280);
    fill(0);
  if((mouseX <380) && (mouseX >320) && (mouseY > 130) && (mouseY <180)){
    beijing();
  }
  if((mouseX <470) && (mouseX >420) && (mouseY > 150) && (mouseY <200)){
    tokyo();
  }
    if((mouseX <420) && (mouseX >380) && (mouseY > 150) && (mouseY <200)){
    incheon();
  }
      if((mouseX <400) && (mouseX >380) && (mouseY > 220) && (mouseY <260)){
    taipei();
  }
        if((mouseX <390) && (mouseX >370) && (mouseY > 190) && (mouseY <230)){
    shanghai();
  }
        if((mouseX <390) && (mouseX >350) && (mouseY > 230) && (mouseY <260)){
    hongKong();
  }
          if((mouseX <390) && (mouseX >370) && (mouseY > 190) && (mouseY <230)){
    hangzhou();
  }
            if((mouseX <350) && (mouseX >300) && (mouseY > 310) && (mouseY <350)){
    singapore();
  }
            if((mouseX <350) && (mouseX >300) && (mouseY > 310) && (mouseY <350)){
    kualaLumpur();
  }
              if((mouseX <360) && (mouseX >310) && (mouseY > 360) && (mouseY <390)){
    jakarta();
  }
                if((mouseX <350) && (mouseX >300) && (mouseY > 270) && (mouseY <300)){
    bangkok();
  }
  

}
}

void beijing(){
String[] s = loadStrings("http://24timezones.com/world_directory/current_beijing_time.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Beijing: "+ss, 10, 20);
}

void incheon(){
  String[] s = loadStrings("http://24timezones.com/world_directory/current_incheon_time.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Incheon: "+ss, 10, 40); 
}

void taipei(){
String[] s = loadStrings("http://24timezones.com/world_directory/time_in_taipei.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
} 
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Taipei: "+ss, 10, 60);
}

void shanghai(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_shanghai.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Shanghai: "+ss, 10, 80); 
}

void hongKong(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_hong_kong.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Hong-Kong: "+ss, 10, 100); 
}

void tokyo(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_tokyo.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Tokyo: "+ss, 10, 120); 
}

void hangzhou(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_hangzhou.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Hangzhou: "+ss, 10, 140); 
}

void singapore(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_singapore.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Singapore: "+ss, 10, 160); 
}

void kualaLumpur(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_kuala_lumpur.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Kuala Lumpur: "+ss, 10, 180); 
}

void jakarta(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_jakarta.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Jakarta: "+ss, 10, 200); 
}

void bangkok(){
  String[] s = loadStrings("http://24timezones.com/world_directory/time_in_bangkok.php");
String p = "";
for(int i=0;i<s.length;i++){
  p += s[i];
}
println(p.length());
String startMarker = " <span id=\"currentTime\">";
String endMarker = "</span>";
int start = p.indexOf(startMarker);
p = p.substring(start+startMarker.length(),p.length());
int end = p.indexOf(endMarker);
String ss = p.substring(0,end);
println(ss);
text("Bangkok: "+ss, 10, 220); 
}

