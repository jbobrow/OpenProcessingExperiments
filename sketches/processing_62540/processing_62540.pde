
int[] display_size = {300,100};
ledDisplay display;
int i = 0;
int j = 0;

void setup(){

size(display_size[0],display_size[1]);
background(17,46,11);
smooth();
display = new ledDisplay(20,6,display_size); //This creates an LED matrix of 20 columns, 6 rows
display.init();

}

void draw(){
  
    
      display.init(); //This turns off all pixels.
      
                      //To turn ON the 3rd pixel down, 5th pixel to the right,
                      //use the command: display.set_pixel(4,2,1);
        
      display.set_pixel(i%display.x_pixels,j%display.y_pixels,1);
      delay(300);
      i++;
      j++;
          
  
}




//Don't change anything below this line unless you know what you are doing!

 
 class ledDisplay {
   int x_pixels;
   int y_pixels;
   int[] display_size;
   int spacing;
   int pixel_size;
   char[] LED_off = {162,129,133};
   char[] LED_on = {250,8,40};
   
   ledDisplay(int x,int y, int[] disp_size){
     x_pixels = x;
     y_pixels = y;
     display_size = disp_size;
     spacing = 0;
     pixel_size = this.calc_pixel_size();
   }
   
   int calc_pixel_size(){
     int a = round((this.display_size[0]-(this.x_pixels+1)*this.spacing)/ (this.x_pixels));
     int b = round((this.display_size[1]-(this.y_pixels+1)*this.spacing)/ (this.y_pixels));
     if (a>b){
       return b;
     }
     else{
       return a;
     }
    }
    void init(){
      for (int i = 0;i < x_pixels;i++){
        for(int j = 0;j<y_pixels;j++){
            fill(LED_off[0],LED_off[1],LED_off[2]);
            ellipse((i+1)*spacing+i*pixel_size + 0.5*pixel_size,(j+1)*spacing+j*pixel_size +0.5*pixel_size,pixel_size,pixel_size);
        };
      };
    }
    void set_pixel(int i, int j, int setting){
      if(setting==1){
        fill(LED_on[0],LED_on[1],LED_on[2]);
      }
      else{
        fill(LED_off[0],LED_off[1],LED_off[2]);
      }
      
      ellipse((i+1)*spacing+i*pixel_size + 0.5*pixel_size,(j+1)*spacing+j*pixel_size +0.5*pixel_size,pixel_size,pixel_size);
      
    }
      
 }
