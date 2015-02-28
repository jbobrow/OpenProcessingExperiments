
// separating a color RGB image into channels : RGB, HSB, CMY, CMYK, B&W
// 20 juillet 2011 / emoc*codelab.fr
// see below for complete keyboard map
// Perceptual Evaluation of Color-to-Grayscale Image Conversions
// >> http://dcgi.felk.cvut.cz/home/cadikm/color_to_gray_evaluation/

PImage img; 
PImage img_r, img_g, img_b, img_h, img_s, img_v;
PImage img_c, img_m, img_y, img_d, img_n, img_z;
PImage img_k, img_w, img_p, img_t, img_e, img_i, img_u;
boolean separation = false; 
String MODE = "O";

void setup() {
  size(1024, 768);
  img = loadImage("paysage22_1024x768.jpg");
  // Red, Green, Blue
  img_r = createImage(img.width, img.height, RGB);
  img_g = createImage(img.width, img.height, RGB);
  img_b = createImage(img.width, img.height, RGB);
  // Hue, Saturation, Brightness
  img_h = createImage(img.width, img.height, RGB);
  img_s = createImage(img.width, img.height, RGB);
  img_v = createImage(img.width, img.height, RGB);
  // Cyan, Magenta, Yellow
  img_c = createImage(img.width, img.height, RGB);
  img_m = createImage(img.width, img.height, RGB);
  img_y = createImage(img.width, img.height, RGB);
  // Cyan, Magenta, Yellow, Black
  img_d = createImage(img.width, img.height, RGB);
  img_n = createImage(img.width, img.height, RGB);
  img_z = createImage(img.width, img.height, RGB);
  img_k = createImage(img.width, img.height, RGB);
  // Black & White
  img_w = createImage(img.width, img.height, RGB); // perceptual weighted average
  img_p = createImage(img.width, img.height, RGB); // gimp weighetd average
  img_t = createImage(img.width, img.height, RGB); // desaturated / lightness
  img_e = createImage(img.width, img.height, RGB); // HSV decompose
  // Negative colors
  img_i = createImage(img.width, img.height, RGB); 
  // Hue image
  img_u = createImage(img.width, img.height, RGB); 
}

void draw() {
  if (separation) {
    if (MODE.equals("O")) image(img, 0, 0);
    if (MODE.equals("R")) image(img_r, 0, 0);
    if (MODE.equals("G")) image(img_g, 0, 0);
    if (MODE.equals("B")) image(img_b, 0, 0);
    if (MODE.equals("H")) image(img_h, 0, 0);
    if (MODE.equals("S")) image(img_s, 0, 0);
    if (MODE.equals("V")) image(img_v, 0, 0);
    if (MODE.equals("C")) image(img_c, 0, 0);
    if (MODE.equals("M")) image(img_m, 0, 0);
    if (MODE.equals("Y")) image(img_y, 0, 0);
    if (MODE.equals("D")) image(img_d, 0, 0);
    if (MODE.equals("N")) image(img_n, 0, 0);
    if (MODE.equals("Z")) image(img_z, 0, 0);
    if (MODE.equals("K")) image(img_k, 0, 0);
    if (MODE.equals("W")) image(img_w, 0, 0);
    if (MODE.equals("P")) image(img_p, 0, 0);
    if (MODE.equals("T")) image(img_t, 0, 0);
    if (MODE.equals("E")) image(img_e, 0, 0);
    if (MODE.equals("I")) image(img_i, 0, 0);
    if (MODE.equals("U")) image(img_u, 0, 0);
    
  } else {
    
    print("separating... ");
    for (int i = 0; i < img.width * img.height; i++) {
      img_r.pixels[i] = color(red(img.pixels[i]), red(img.pixels[i]), red(img.pixels[i]));
      img_g.pixels[i] = color(green(img.pixels[i]), green(img.pixels[i]), green(img.pixels[i]));
      img_b.pixels[i] = color(blue(img.pixels[i]), blue(img.pixels[i]), blue(img.pixels[i]));
      
      img_h.pixels[i] = color(hue(img.pixels[i]), hue(img.pixels[i]), hue(img.pixels[i]));
      img_s.pixels[i] = color(saturation(img.pixels[i]), saturation(img.pixels[i]), saturation(img.pixels[i]));
      img_v.pixels[i] = color(brightness(img.pixels[i]), brightness(img.pixels[i]), brightness(img.pixels[i]));
      
      // CMY formula from http://www.easyrgb.com/index.php?X=MATH&H=11#text11
      float cc = 255 - red(img.pixels[i]);
      float mm = 255 - green(img.pixels[i]);
      float yy = 255 - blue(img.pixels[i]);
      
      img_c.pixels[i] = color(cc, cc, cc);
      img_m.pixels[i] = color(mm, mm, mm);
      img_y.pixels[i] = color(yy, yy, yy);
      
      // CMYK formula from http://www.easyrgb.com/index.php?X=MATH&H=13#text13
      
      float var_K = 1;
      float ccc = cc / 255;
      float mmm = mm / 255;
      float yyy = yy / 255;
      if ( ccc < var_K ) var_K = ccc;
      if ( mmm < var_K ) var_K = mmm;
      if ( yyy < var_K ) var_K = yyy;
      if ( var_K == 1 ) { // Black
        ccc = 0;
        mmm = 0;
        yyy = 0;
      } else {
        ccc = ( ccc - var_K ) / ( 1 - var_K );
        mmm = ( mmm - var_K ) / ( 1 - var_K );
        yyy = ( yyy - var_K ) / ( 1 - var_K );
      }
      float kkk = var_K;
      ccc *= 255;
      mmm *= 255;
      yyy *= 255;
      kkk *= 255;
      
      img_d.pixels[i] = color(ccc, ccc, ccc);
      img_n.pixels[i] = color(mmm, mmm, mmm);
      img_z.pixels[i] = color(yyy, yyy, yyy);
      img_k.pixels[i] = color(kkk, kkk, kkk);
      
      // RGB to Grayscale : 0.21 R + 0.71 G + 0.08 B. (weighted perceptual average)
      // adapted from http://www.johndcook.com/blog/2009/08/24/algorithms-convert-color-grayscale/
      float www = (0.21 * red(img.pixels[i])) + (0.71 * green(img.pixels[i])) + (0.08 * blue(img.pixels[i])); 
      img_w.pixels[i] = color(www, www, www);
      
      // RGB to Grayscale : 0.3 R + 0.59 G + 0.11 B (gimp grayscale)
      // from http://gimp-savvy.com/BOOK/index.html?node54.html
      float ppp = (0.3 * red(img.pixels[i])) + (0.59 * green(img.pixels[i])) + (0.11 * blue(img.pixels[i])); 
      img_p.pixels[i] = color(ppp, ppp, ppp);
      
      // RGB to Grayscale : desaturate / lightness : L = ( max(R,G,B) + min(R,G,B) ) / 2
      // from http://gimp-savvy.com/BOOK/index.html?node54.html
      float ttt = ( max(red(img.pixels[i]), green(img.pixels[i]), blue(img.pixels[i]))
                    + min(red(img.pixels[i]), green(img.pixels[i]), blue(img.pixels[i])) ) / 2;
      img_t.pixels[i] = color(ttt, ttt, ttt);
      
      // RGB to Grayscale : HSB decompose V = max(R,G,B)
      // from http://gimp-savvy.com/BOOK/index.html?node54.html
      float eee = max(red(img.pixels[i]), green(img.pixels[i]), blue(img.pixels[i]));
      img_e.pixels[i] = color(eee, eee, eee); 
    }
    
    
    colorMode(HSB);
    for (int i = 0; i < img.width * img.height; i++) {
      // Negative colors 
      img_i.pixels[i] = color( ((hue(img.pixels[i]) + 128)%255), saturation(img.pixels[i]), brightness(img.pixels[i]));
      // Hue picture
      img_u.pixels[i] = color( red(img_h.pixels[i]), 128, 200);
    }
    colorMode(RGB);
    
    println("DONE");
    separation = true;
  }
}

void keyPressed() {
  if (key == 'o') MODE = "O"; // original RGB image
  if (key == 'r') MODE = "R"; // RGB mode : RED
  if (key == 'g') MODE = "G"; // RGB mode : GREEN
  if (key == 'b') MODE = "B"; // RGB mode : BLUE
  if (key == 'h') MODE = "H"; // HSB mode : HUE
  if (key == 's') MODE = "S"; // HSB mode : SATURATION
  if (key == 'v') MODE = "V"; // HSB mode : BRIGHTNESS
  if (key == 'c') MODE = "C"; // CMY mode : CYAN
  if (key == 'm') MODE = "M"; // CMY mode : MAGENTA
  if (key == 'y') MODE = "Y"; // CMY mode : YELLOW
  if (key == 'd') MODE = "D"; // CMYK mode = CYAN
  if (key == 'n') MODE = "N"; // CMYK mode : MAGENTA
  if (key == 'z') MODE = "Z"; // CMYK mode : YELLOW
  if (key == 'k') MODE = "K"; // CMYK mode : BLACK
  if (key == 'w') MODE = "W"; // Black & White / weighted perceptual average
  if (key == 'p') MODE = "P"; // Black & White / gimp grayscale
  if (key == 't') MODE = "T"; // Black & White / desaturate, lightness
  if (key == 'e') MODE = "E"; // Black & White / HSB decompose
  if (key == 'i') MODE = "I"; // Negative colors
  if (key == 'u') MODE = "U"; // Hues
}


