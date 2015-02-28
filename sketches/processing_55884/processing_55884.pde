
/*
Fields and facets are key concepts for the Article Search API.

A field is a piece of data. Some fields are searchable, others can be used as a facet.

A facet is a special type of field. Facets help filter your search by specific fields such as publication year,
month, etc.
 
You can view a summary of all data fields here:
http://developer.nytimes.com/docs/read/article_search_api#h3-data-fields
*/

void getArticles(ArrayList articles, String query, String publicationYear, String classifier, String offset) {
  /*
  First, we create a new search query object.
  Note that each call to the TimesArticleSearch counts as an API call. The limit is 5000 calls per day.
  */
  TimesArticleSearch mySearch = new TimesArticleSearch();
  /*
  By default (unless you include a fields list in your request), the following fields are returned 
  for each result: body, byline, date, title, url
  */
  
  // Restrict the search to articles that contain certain keywords (can be left blank).
  mySearch.addQueries(query);
     
  // Restrict the search to a specified year and classifier
  //mySearch.addFacetQuery("publication_year", publicationYear);
  mySearch.addFacetQuery("classifiers_facet", classifier); 
  
  /*
  Use .addExtra("offset", n) to get results in increments of 10, where "n" represents the 'page' number.
  The value of offset corresponds to a set of 10 results (it does not indicate the starting number
  of the result set). For example, offset=0 corresponds to records 0-9. To return records 10-19,
  set offset to 1, not 10.
  */
  mySearch.addExtra("offset", offset);
    
  
  // Now, we do the search, and get returned a TimesArticleSearch object, which contains the goodies.
  TimesArticleSearchResult myResult = mySearch.doSearch();

  // This allows us to get the article data, as so:
  println("====================");
  println("Articles: ");

  // print total number of results turned back from query
  print(myResult.total);

  // iterate over results
  for (int i = 0; i < myResult.results.length; i++) {

    String title = myResult.results[i].title;
    String author = myResult.results[i].author; // results appear to be null
    String _abstract = myResult.results[i]._abstract; // results appear to be null
    String leadParagraph = myResult.results[i].lead_paragraph; // results appear to be null
    String byline = myResult.results[i].byline;
    String body = myResult.results[i].body;
    String date = myResult.results[i].date;
    String url = myResult.results[i].url;

    println("....................");
    println("Title: " + title);
    println("Author: " + author);
    println("Abstract: " + _abstract);
    println("Lead paragraph: " + leadParagraph);
    println("Byline: " + byline);
    println("Body: " + body);
    println("Date: " + date); // Date format: YYYYMMDD
    println("URL: " + url);

    /*
    Remove category stub from title and add to separate variable.
    A title comes in looking like this: "OP-ED CONTRIBUTOR; U.S. Policy on Egypt Needs a Big Shift"
    */
    String[] segments = split(title, "; ");
    String category = "";
    if (segments.length > 1) { // make sure there are at least two segments; the category and the title
      category = segments[0]; // assign category to first segment
      title = segments[1]; // assign title variable back to second segment
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

    // assign category
    int setCategory = -1;
    if (classifier == "Top/News/U.S.") {
      setCategory = 0; 
    }
    if (classifier == "Top/News/World") {
      setCategory = 1; 
    }    
    
    if (date != null) { // make sure there is a date as part of the article! it is needed for sorting
      // add article to articles ArrayList
      // Article (float x_, float y_, float r_, color c_, String timePublished_, String headline_, String url_) {
      articles.add(new Article(random(width), random(height), random(5, 30), setCategory, date, title, url,  query));
    }
  }
}

