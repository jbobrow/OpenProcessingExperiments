

//
// GET GOOGLE IMAGES SEARCH RESULTS 
//
// I use the ajax.googleapis.com json search results to fetch the image
// urls into a string array and display them one at a time
//
// Youssef Faltas, Feb 2014


String searchTerm = "sisi";
int numofResults = 40;                  // choose a multiple of four


String[] imgUrls = new String[0];
String[] links = new String[0];
JSONArray results; 
JSONObject response;
PImage img;
int i =0;
int t =0;
 
void setup()
{
  size(800,600);
  links = img_urls(numofResults/4);      // returns an array of image url strings
  int t = second();                      // start a clock 
}
 
void draw(){
  
 if ( second() < t ) t = 0 ;          // fixing the clock at the start of every minute
 if ( i == numofResults ) i = 0 ;     // starting over when we reach the final result 
 
 if (second() > t+2 )                 // display a new image every two seconds
  {
   t = second();                      
   i++;  
   img = loadImage(links[i],"jpg");
   if (img != null ) image(img, 0, 0, width, height);  // display and fit image to display window
   println(i);
   println(links[i]);                 // prints its link to console
   }
 
} 
 
String[] img_urls(int fours)
{
  String[] url = new String[fours];
  String[] links = new String[4*fours];
   
  for(int t=0; t<fours; t++)
      {        
        url[t] = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+searchTerm+ "&start="+(t*4)+"&as_filetype=jpg"+"&imgsz=medium"; //ift:jpg,isz:m";
        
        // find more search arguments here
        // https://developers.google.com/image-search/v1/jsondevguide#json_args
        
        response = loadJSONObject(url[t]);
        response = response.getJSONObject("responseData");
        results = response.getJSONArray("results");

        for (int i = 0; i < results.size(); i++) {
    
          JSONObject result = results.getJSONObject(i); 

          int high = result.getInt("height");
          int wide = result.getInt("width");
          String linkstring = result.getString("unescapedUrl");
          links[(i+(4*t))] = linkstring;
          
          //println("Photo has height " + high + " and width " + wide + " is at ");
          //println(linkstring);        
        } 
      }    
   return links;
}

