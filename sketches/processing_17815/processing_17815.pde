
BufferedReader reader;
String line, c, str;
int count, w, pixelSize;
boolean read;

void setup(){
  background(0);
  reader = createReader("SelfPrintingSketch2.pde");
  read = true;
  pixelSize = 15;
  str = "";
 while(read){ 
   try{
    line = reader.readLine();
  } catch (IOException e){
    e.printStackTrace();
    line = null;
  }
  if (line == null){
    read = false;
  } else {
    for(int x = 0; x < line.length(); x++){
      c = String.valueOf(line.charAt(x));
      count++;
    }  
    str = str + line; 
  }
 }
  w = nearestSquare(count);
  size(w * pixelSize, w * pixelSize);
  
    for(int i = 0; i < str.length(); i++){
      fill(String.valueOf(str.charAt(i)).hashCode());
      rect(pixelSize*(i % w), pixelSize*(i / w) , pixelSize, pixelSize);
    }
}

int nearestSquare(int n){
  int i = 2;
  while(i*i < n){
    i++;
  }
  return i;
}

