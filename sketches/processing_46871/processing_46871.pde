
String webpage = "";
String [] webpageArray = loadStrings("index.html");

for(int i=0;i<webpageArray.length;i++){
  webpage += webpageArray[i];
}

webpage = webpage.replace("  "," ");
webpage = webpage.replace("	","");

String[] m1 = match(webpage, "<div id=\"article\">(.*)</div></div>");

//String[] m1 = match(webpage, "<span id=\"articleHeader\">(.*)</span>");

//String[] m1 = match(webpage, "NAKED (.*) - just two");

//println(webpage);
println(m1[1]);

size(640,480);
background(255);
fill(0);

String s = m1[1];
text(s, 15, 20, width, height);

