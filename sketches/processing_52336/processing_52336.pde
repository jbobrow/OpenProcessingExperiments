
//imageFlip function by nick lally 
//modified by the other keith peters
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally

PImage imageFlip(PImage imageName, String mode){

 PImage ret = new PImage( imageName.width, imageName.height );
 ret.loadPixels();

 imageName.loadPixels();
 
 //records original pixel config so it can set it back at the end
 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   println( "v2" );
   for(int i = 0; i < imageName.height; i++){
     int fromi = i > imageName.height / 2 ? imageName.height - i : i;
     for(int j = 0; j < imageName.width; j++){
       ret.pixels[i*(imageName.width) + j] = imageName.pixels[fromi*(imageName.width) + j];
     }
   }

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       ret.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   for(int i = 0; i < imageName.height; i++){
     for(int j = 0; j < imageName.width; j++){
       int fromj = j > imageName.width / 2 ? imageName.width - j : j;
       ret.pixels[i*imageName.width + j] = imageName.pixels[i*(imageName.width) + fromj];
     }
   }

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       ret.pixels[(i+1)*(imageName.width) - j] = imageName.pixels[i*imageName.width + j];
     }
   }
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }
 println( "updating pixels " + ret.width + "," + ret.height );
 imageName.updatePixels();
 ret.updatePixels();

 return ret;
}


