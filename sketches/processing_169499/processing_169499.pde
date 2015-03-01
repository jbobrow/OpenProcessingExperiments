
//created by Yui Arco Kita
//http://bluedog.herokuapp.com/godblesspaint

PImage img, tmp, color_ref_img;
boolean stopped = false;
color ink_color = color(240, 135, 0);
color border_color = color (0);
color canvas_color = color(255);
int binary_thre = 130;
int gradient_power = 12;

void setup(){
  String file_name = "halloween.png";
  img = loadImage(file_name);
  tmp = loadImage(file_name);
  //size(img.width, img.height);
  background(255);
  binarize_image(img);
  binarize_image(tmp);
}

boolean delay_flag = false;
void draw(){
  if(delay_flag){
    delay(10000);
  }
  if(stopped){
    PVector not_yet = search_canvas_area();
    plot_ink((int)not_yet.x, (int)not_yet.y, ink_color);
  }
  proc();
  image(img, 0, 0);
  hide_border();
  img.updatePixels();
}

void mouseMoved(){
  if(img.get(mouseX, mouseY) == canvas_color){
    ink_color = gradify(ink_color, 10);
    plot_ink(mouseX, mouseY, ink_color);
  }
}

void proc(){
  stopped = true;
  for(int x = 0; x < tmp.width; x++){
    for(int y = 0; y < tmp.height; y++){
      int center_x = x;
      int center_y = y;
      color center_color = tmp.get(center_x, center_y);
      if(center_color == canvas_color ||
         center_color == border_color
        ){
        continue;
      }
      for(int xx = -1; xx < 2; xx++){
        for(int yy = -1; yy < 2; yy++){
          int focus_x = x + xx;
          int focus_y = y + yy;
          if(out(focus_x, focus_y)){
            continue;
          }
          color focus_color = tmp.get(focus_x, focus_y);
          if(focus_color != canvas_color){
            continue;
          }
          if(random(100) < 90){
            continue;
          }
          color fill_color = gradify(center_color, gradient_power);
          img.set(focus_x, focus_y, fill_color);
          stopped = false;
        }
      }
    }
  }
  tmp = img.get(0, 0, img.width, img.height);
}

boolean out(int x, int y){
  if(x < 0 || img.width - 1 < x || y < 0 || img.height - 1 < y){
    return true;
  }else{
    return false;
  }
}

void binarize_image(PImage img){
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      color c = img.get(x, y);
      if((red(c) + green(c) + blue(c)) / 3 < binary_thre){
        img.set(x, y, color(255));
      }else{
        img.set(x, y, color(0));
      }
    }
  }
}

color gradify(color c, int gradient_power){
  //tune here yourself
  return color(
  red(c) + random(-gradient_power / 2, gradient_power / 2 + 1),
  green(c)+random(-gradient_power / 3, gradient_power / 3 + 1),
  blue(c)+random(-gradient_power, gradient_power + 1));
}

PVector search_canvas_area(){
  for(int x = 0; x < tmp.width; x++){
    for(int y = 0; y < tmp.height; y++){
      color focus_color = tmp.get(x, y);
      if(focus_color == canvas_color){
        return new PVector(x, y);
      }
    }
  }
  return new PVector(0, 0);
}

void plot_ink(int x, int y, color ink_color){
  img.set(x, y, ink_color);
}

void hide_border(){
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      if(get(x, y) == border_color){
        set(x, y, color(255));
      }
    }
  }
}

void keyPressed(){
  if(key == 'a'){
    gradient_power++;
  }else if(key == 'A'){
    gradient_power--;
  }else if(key == 'b'){
    delay_flag = !delay_flag;
  }
  println(gradient_power);
}


