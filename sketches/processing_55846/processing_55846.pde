
/*
Fields and facets are key concepts for the Article Search API.

A field is a piece of data. Some fields are searchable, others can be used as a facet.

A facet is a special type of field. Facets help filter your search by specific fields such as publication year,
month, etc.
 
You can view a summary of all data fields here:
http://developer.nytimes.com/docs/read/article_search_api#h3-data-fields
*/


Category[] getFacets(String query, String country, String publicationYear, String facet) {
  /*
  The Article Search API supports faceted searching, which can be much more powerful than standard 
  keyword searching. Facets (whose field names are appended with _facet for easy identification) can 
  help you explore Times-specific categorys and subjects. 
  */
  
  /*
  First, we create a new search query object
  //Note that each call to the TimesArticleSearch counts as an API call. The limit is 5000 calls per day.
  */
  TimesArticleSearch mySearch = new TimesArticleSearch();
  
  // Restrict the search to articles that contain certain keywords (can be left blank).
  mySearch.addQueries(query);
  
  // Restrict the search to a specified year
  mySearch.addFacetQuery("publication_year", publicationYear);
  mySearch.addFacetQuery("geo_facet", country);
  
  
  // Get number of articles for a particular facet, e.g. publication_month
  mySearch.addFacets(facet);

  // Now, we do the search, and get returned a TimesArticleSearch object, which contains the goodies.
  TimesArticleSearchResult myResult = mySearch.doSearch();

  /*
  We get the facet list from the search return - this is an array of TimesFacetObjects.
  Note that the NYT API can only return up to 15 facets at a time. You may have to make multiple calls to the
  API to get the amount of data you need.
  */
  TimesFacetObject[] getFacets = myResult.getFacetList(facet);
  Category[] categories = new Category[getFacets.length];
  
  // Print the number of matching articles for a particular facet (e.g. per month, per year, etc.)
  println("====================");
  println("Facets");

  for (int i = 0; i < getFacets.length; i++) {
    println(publicationYear + "-" + getFacets[i].term + ":" + getFacets[i].count);
    
    String term = getFacets[i].term;
    
    // remove commas from term
    term = term.replace(",", "");

    // add facet to object array
    categories[i] = new Category(term, getFacets[i].count, random(width), random(height));
  }
  
  return categories;
}

