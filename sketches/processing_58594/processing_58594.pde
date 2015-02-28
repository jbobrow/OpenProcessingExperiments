
void draw(){
  float now = millis();
  drawBox();
  if(ask == true && stopnow == true){
    if(now > startTime + count){
      ninja.makeRequest();
      ninjaDiys = getMatchCount("diy", html);
      ninjaBrands = getMatchCount("brand",html);
      ninjaFashions = getMatchCount("fashion",html);
      ninjaBlogs = getMatchCount("blogger",html);
      ninjaShops = getMatchCount("shop ",html);
      println("ninja diy: "+ninjaDiys);
      println("ninja brand: "+ninjaBrands);
      println("ninja fashion: "+ninjaFashions);
      println("ninja blog: "+ninjaBlogs);
      println("ninja shop: "+ninjaShops);
      
      other.makeRequest();
      otherDiys = getMatchCount("diy", html2);
      otherBrands = getMatchCount("brand",html2);
      otherFashions = getMatchCount("fashion ",html2);
      otherBlogs = getMatchCount("blogger",html2);
      otherShops = getMatchCount("shop",html2);
      println("other diy: "+otherDiys);
      println("other brand: "+otherBrands);
      println("other fashion: "+otherFashions);
      println("other blog: "+otherBlogs);
      println("other shop: "+otherShops);
      ask = false;
    }
   }
   if(ask == false && stopnow == true){
     drawNinja();
     drawOther();
     stopnow = false;
   }
   if(stopnow == false){
     ask = false;
     stopnow = false;
   }    
}

void netEvent(HTMLRequest ninja/*, HTMLRequest a*/) {
  html = ninja.readRawSource();
  html2 = other.readRawSource();
  gotnew = true;
}

int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}


