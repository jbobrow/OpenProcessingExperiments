
/*
####################
##    CRAWLING    ##
##   by vagmakr   ##
####################
*/
//"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=" +searchTerm+"start=4&userip=MyIP";
String searchTerm = "pig";
String[] imgUrls=new String[0];

void setup()
{
  size(300,800);
  img_urls();
}

void img_urls()
{
  String[] url=new String[10];
  String src="\\\\"unescapedUrl\":\"";
  
  for(int t=0; t<10; t++)
      {
//      take some results
        url[t] = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+searchTerm+"start="+(t*4)+"&userip=MyIP";
        String lines[] = loadStrings(url[t]);
        for(int l=0; l<lines.length; l++ ) 
            {
              println(lines[l]);
              println("#");
              int indx =0;
              int again=0;
//              search inside the results for the specific term -> "unescapedUrl":"
              while(indx != -1){
                indx=lines[l].indexOf(src,again);
                if(indx>0)
                {
                  int indx2 = lines[l].indexOf("\"", indx + src.length() );
                  String st = lines[l].substring(indx+ src.length(), indx2);
                  again=indx2;

//                keep the urls of the images in a list
                  imgUrls = append(imgUrls, st);
                }
              }
            }
      }
  println("  ###");
  println("-------------------------------");
  println("  ###");

  for(int t=0; t<imgUrls.length; t++ )
    {
//    print the urls of the images
      println(imgUrls[t]);
      text(imgUrls[t],0,t*15+10)
    }
}
