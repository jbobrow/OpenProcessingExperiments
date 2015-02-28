


String apiKey = "< API KEY HERE>";                    
String baseURL = "http://api.nytimes.com/svc/search/v1/article";

int offset;


void getArticles(ArrayList articles, String query_, int offset_) { // String desFacet_, String org_facets) { // String publicationYear, // went after query: String subject, 
  
  /* Other facets
  geo_facet             Geographic locations
  per_facet             Persons mentioned
  des_facet             Subject terms assigned ALL CAPS POLITICS AND GOVERNMENT - gives Array of Strings
  desk_facet            Times desk that produced story e.g. Business/Financial Desk
  column_facet          e.g. Weddings, or Ideas & Trends      
  word_count            
  section_page_facet    full page number of printed article (e.g. D00002) online articles don't have it
  */
  // desFacet = desFacet_;
  offset = offset_;
  query = query_;
  String rank = "oldest";
  int beginDate = 19810101;
  int endDate = 20120225;
  // Fields added at end of request to pull out info
  String fields = "&fields=title,body,url,publication_year,publication_month,publication_day"; 
  // Facets added at beginning to tell it you want this specific info turned back. (if a facet is here, it must be in the &fields line as well)
  String facets = "%20&facets=geo_facet";
  
  // Construct the big fat URL to send in "%20des_facet:[" + desFacet + "]" +
  String request = baseURL + "?query=" + query  + "%20&begin_date=" + beginDate + "&end_date=" + endDate + fields + "&rank=" + rank + "&offset=" + offset + apiKey;
  println("URL: " + request);
 
  // Let's get the stuff out 
  try {
    JSONObject nytData = new JSONObject(join(loadStrings(request), ""));
    JSONArray results = nytData.getJSONArray("results");

    // println(results);

    // loop through array of results and grab variables for each JSON object
    for (int i = 0; i < results.length(); i++) {
      JSONObject entry = results.getJSONObject(i);

      String nytTitle = entry.getString("title");
      String nytBody = entry.getString("body");
      String nytURL = entry.getString("url");
      // int pubDate = entry.getInt("date");
      int articleYear = entry.getInt("publication_year");
      int articleMonth = entry.getInt("publication_month");
      int articleDay = entry.getInt("publication_day");
      int total = nytData.getInt("total");
      // String organizations = entry.getString("org_facet");
      // String people = entry.getString("per_facet");
      //String desc = entry.getString("des_facet");
      // String desk = entry.getString("desk_facet");
     // String geo = entry.getString("geo_facet");

      println("===============================" + "\n" + "Article # " + (offset + i));
      println("TOTAL ARTICLES: " + total);
      println(nytTitle + "\n" + nytBody + "\n" + nytURL + "\n" + articleYear + ", " + articleMonth + ", " + articleDay + "\n"); // + ", " + organizations); //  

      /*
      Remove category stub from title and add to separate variable.
       A title comes in looking like this: "OP-ED CONTRIBUTOR; U.S. Policy on Egypt Needs a Big Shift"
       */
      String[] segments = split(nytTitle, "; ");
      String category = "";
      if (segments.length > 1) { // make sure there are at least two segments; the category and the title
        category = segments[0]; // assign category to first segment
        nytTitle = segments[1]; // assign title variable back to second segment
      }

      /*
      Next, we are going to create unique Category objects from the article data.
       This includes checking for duplicates (below), if the category is already present.
       Start by creating a new Category object.
       */
      Category categoryObject = new Category(category);

      /*
      Make sure the category isn't already present as an object.
       If it is not present, add to object array. Otherwise, use existing category.
       */
      Boolean duplicate = false;
      for (int n = 0; n < categories.size(); n++) {
        Category matchingCategory = (Category) categories.get(n);
        if (categoryObject.name.equals(matchingCategory.name)) {
          duplicate = true;
          categoryObject = matchingCategory; // assign existing object to new category object, rather than duplicating it
        }
      }
      if (!duplicate) {
        // add venue to array list
        categories.add(categoryObject);
      }

      // add article to articles ArrayList
      articles.add(new Article(offset + i, nytTitle, categoryObject, nytBody, articleYear, articleMonth, articleDay, nytURL));
    }
  }
  catch (JSONException e) {
    println("There was an error parsing the JSONObject");
  }
}


