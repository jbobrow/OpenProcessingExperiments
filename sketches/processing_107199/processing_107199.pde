
PImage teclado;

void setup () {
  size (624, 302);
  teclado = loadImage ("winkeyboard-leftside.gif");
  noStroke ();
  fill (245,106,106,70);
}

void draw () {
  background (0);
  image (teclado, 0, 0);
  
  if (mousePressed) {
    if (mouseY > 90 && mouseY <=128){
      if (mouseX < 46)
        rect (14, 90, 33, 33);
    else if (mouseX < 86){ 
        rect (54, 90, 33, 33);
        key = '1';}
      else if (mouseX < 126){
        rect (94, 90, 33, 33);
        key = '2';}
      else if (mouseX < 166) {
        rect (134, 90, 33, 33);
        key = '3';}
      else if (mouseX < 206){
        rect (174, 90, 33, 33);
        key = '4';}
      else if (mouseX < 246) {
        rect (214, 90, 33, 33);
        key = '5';}
      else if (mouseX < 286){
        rect (254, 90, 33, 33);
        key = '6';}
      else if (mouseX < 326) {
        rect (294, 90, 33, 33);
        key = '7';}
      else if (mouseX < 366){
        rect (334, 90, 33, 33);
        key = '8';}
      else if (mouseX < 406){
        rect (374, 90, 33, 33);
        key = '9';}
      else if (mouseX < 446) {
        rect (414, 90, 33, 33);
        key = '0';}
      else if (mouseX < 486){
        rect (454, 90, 33, 33);
        key = '-';}
      else if (mouseX < 526) {
        rect (494, 90, 33, 33);
        key = '=';}
      else {
        rect (534, 90, 74, 33);
        key = BACKSPACE;}        

      }
      
    else if (mouseY > 128 && mouseY <=166){
      if (mouseX < 66){
        rect (14, 128, 53, 33);
        key = TAB;}
      else if (mouseX < 106) {
        rect (74, 128, 33, 33);
        key = 'q';}
      else if (mouseX < 146){
        rect (114, 128, 33, 33);
        key = 'w';}
      else if (mouseX < 186) {
        rect (154, 128, 33, 33);
        key = 'e';}
      else if (mouseX < 226){
        rect (194, 128, 33, 33);
        key = 'r';}
      else if (mouseX < 266) {
        rect (234, 128, 33, 33);
        key = 't';}
      else if (mouseX < 306){
        rect (274, 128, 33, 33);
        key = 'y';}
      else if (mouseX < 346) {
        rect (314, 128, 33, 33);
        key = 'u';}
      else if (mouseX < 386){
        rect (354, 128, 33, 33);
        key = 'i';}
      else if (mouseX < 426){
        rect (394, 128, 33, 33);
        key = 'o';}
      else if (mouseX < 466) {
        rect (434, 128, 33, 33);
        key = 'p';}
      else if (mouseX < 506){
        rect (474, 128, 33, 33);
        key = '[';}
      else if (mouseX < 546) {
        rect (514, 128, 33, 33);
        key = ']';}
      else 
        rect (554, 128, 54, 33);  


      }
      
    else if (mouseY > 166 && mouseY <=204){
      if (mouseX < 76) 
        rect (14, 170, 63, 33);        
      else if (mouseX < 119) {
        rect (84, 170, 33, 33);
        key = 'a';}
      else if (mouseX < 159){
        rect (124, 170, 33, 33);
        key = 's';}
      else if (mouseX < 199) {
        rect (164, 170, 33, 33);
        key = 'd';}
      else if (mouseX < 239){
        rect (204, 170, 33, 33);
        key = 'f';}
      else if (mouseX < 279) {
        rect (244, 170, 33, 33);
        key = 'g';}
      else if (mouseX < 319){
        rect (284, 170, 33, 33);
        key = 'h';}
      else if (mouseX < 359) {
        rect (324, 170, 33, 33);
        key = 'j';}
      else if (mouseX < 399){
        rect (364, 170, 33, 33);
        key = 'k';}
      else if (mouseX < 439){
        rect (404, 170, 33, 33);
        key = 'l';}
      else if (mouseX < 479) {
        rect (444, 170, 33, 33);
        key = ';';}
      else if (mouseX < 519) {
        rect (484, 170, 33, 33);
        key = ',';}
      else  {
        rect (524, 170, 82, 33);
        key = ENTER;}
      }
      
    else if (mouseY > 204 && mouseY <=242){
      if (mouseX < 99){
        rect (14, 209, 83, 33);
        key = SHIFT;}
      else if (mouseX < 139) {
        rect (103, 209, 33, 33);
        key = 'z';}
      else if (mouseX < 179){
        rect (144, 209, 33, 33);
        key = 'x';}
      else if (mouseX < 219) {
        rect (184, 209, 33, 33);
        key = 'c';}
      else if (mouseX < 259){
        rect (224, 209, 33, 33);
        key = 'v';}
      else if (mouseX < 299) {
        rect (264, 209, 33, 33);
        key = 'b';}
      else if (mouseX < 349){
        rect (304, 209, 33, 33);
        key = 'n';}
      else if (mouseX < 389) {
        rect (344, 209, 33, 33);
        key = 'm';}
      else if (mouseX < 429){
        rect (384, 209, 33, 33);
        key = '<';}
      else if (mouseX < 469){
        rect (424, 209, 33, 33);
        key = '>';}
      else if (mouseX < 509) {
        rect (464, 209, 33, 33);
        key = '/';}
      else {
        rect (504, 209, 103, 33);
        key = SHIFT;}
      }
    else if (mouseY > 242 && mouseY <=304){
      if (mouseX < 69){
        rect (14, 250, 55, 33);
        key = CONTROL;}
      else if (mouseX < 120) 
        rect (71, 250, 48, 33);
      else if (mouseX < 169){
        rect (123, 250, 44, 33);
        key = ALT;}
      else if (mouseX < 408) {
        rect (171, 250, 233, 33);
        key = ' ';}
      else if (mouseX < 459){
        rect (410, 250, 50, 33);
        key = ALT;}
      else if (mouseX < 510) 
        rect (460, 250, 50, 33);
      else if (mouseX < 560)
        rect (510, 250, 50, 33);
      else{
        rect (560, 250, 50, 33);
        key = CONTROL;}
      }
    }
    
  
  if (keyPressed) {

    if (key == '1' || key == '!'){
      rect (53, 91, 33,33);}
    if (key == '2' || key == '@'){
      rect (93, 91, 33,33);}
    if (key == '3' || key == '#'){
      rect (133, 91, 33,33);}
    if (key == '4' || key == '$'){
      rect (173, 91, 33,33);}
    if (key == '5' || key == 'T'){
      rect (213, 91, 33,33);}
    if (key == '6' || key == 'Y'){
      rect (253, 91, 33,33);}
    if (key == '7' || key == 'U'){
      rect (293, 91, 33,33);}
    if (key == '8' || key == 'I'){
      rect (333, 91, 33,33);}
    if (key == '9' || key == 'O'){
      rect (373, 91, 33,33);}
    if (key == '0' || key == 'P'){
      rect (413, 91, 33,33);}
    if (key == '-' || key == '`'){
      rect (453, 91, 33,33);}
    if (key == '=' || key == '{'){
      rect (493, 91, 33,33);}
    
    if (key == 'q' || key == 'Q'){
      rect (74, 131, 33,33);}
    if (key == 'w' || key == 'W'){
      rect (114, 131, 33,33);}
    if (key == 'e' || key == 'E'){
      rect (154, 131, 33,33);}
    if (key == 'r' || key == 'R'){
      rect (194, 131, 33,33);}
    if (key == 't' || key == 'T'){
      rect (234, 131, 33,33);}
    if (key == 'y' || key == 'Y'){
      rect (274, 131, 33,33);}
    if (key == 'u' || key == 'U'){
      rect (314, 131, 33,33);}
    if (key == 'i' || key == 'I'){
      rect (354, 131, 33,33);}
    if (key == 'o' || key == 'O'){
      rect (394, 131, 33,33);}
    if (key == 'p' || key == 'P'){
      rect (434, 131, 33,33);}
    if (key == '´' || key == '`'){
      rect (474, 131, 33,33);}
    if (key == '[' || key == '{'){
      rect (514, 131, 33,33);}
      

    if (key == 'a' || key == 'A'){
      rect (83, 171, 33,33);}
    if (key == 's' || key == 'S'){
      rect (123, 171, 33,33);}
    if (key == 'd' || key == 'D'){
      rect (163, 171, 33,33);}
    if (key == 'f' || key == 'F'){
      rect (203, 171, 33,33);}
    if (key == 'g' || key == 'G'){
      rect (243, 171, 33,33);}
    if (key == 'h' || key == 'H'){
      rect (283, 171, 33,33);}
    if (key == 'j' || key == 'J'){
      rect (323, 171, 33,33);}
    if (key == 'k' || key == 'K'){
      rect (363, 171, 33,33);}
    if (key == 'l' || key == 'L'){
      rect (403, 171, 33,33);}
    if (key == 'ç' || key == 'Ç'){
      rect (443, 171, 33,33);}
    if (key == '~' || key == '^'){
      rect (483, 171, 33,33);}
    if (key == ']' || key == '}'){
      rect (523, 171, 85,33);}
      
    if (key == 'z' || key == 'Z'){
      rect (103, 211, 33,33);}
    if (key == 'x' || key == 'X'){
      rect (143, 211, 33,33);}
    if (key == 'c' || key == 'C'){
      rect (183, 211, 33,33);}
    if (key == 'v' || key == 'V'){
      rect (223, 211, 33,33);}
    if (key == 'b' || key == 'B'){
      rect (263, 211, 33,33);}
    if (key == 'n' || key == 'N'){
      rect (303, 211, 33,33);}
    if (key == 'm' || key == 'M'){
      rect (343, 211, 33,33);}
    if (key == ',' || key == '<'){
      rect (383, 211, 33,33);}
    if (key == '.' || key == '>'){
      rect (423, 211, 33,33);}
    if (key == ';' || key == ':'){
      rect (463, 211, 33,33);}
    if (key == '/' || key == '?'){
      rect (503, 211, 33,33);}
      
    if (key == ' '){
      rect (169, 250, 240,33);
    }      
  }  
}


