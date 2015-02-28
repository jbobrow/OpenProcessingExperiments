
String webpage = "";
String [] webpageArray = loadStrings("http://www.openprocessing.org/portal/");

for(int i=0;i<webpageArray.length;i++){
  webpage += webpageArray[i];
}

webpage = webpage.replace("  "," ");
webpage = webpage.replace("	","");
//String[] m1 = match(webpage, "<div id=\"userDetails\" class=\"floatRight\" style=\"width:300px; padding:7px 0;\"><h1 style=\"display:inline;\">(.*)</h1>									is an OpenProcessing member since February 12, 2008.			<br />			<div class=\"clearDiv\">");
String[] m1 = match(webpage, "<div id=\"userDetails\" class=\"floatRight\" style=\"width:300px; padding:7px 0;\"><h1 style=\"display:inline;\">(.*)</h1>is an OpenProcessing member");

println(m1[1]);




