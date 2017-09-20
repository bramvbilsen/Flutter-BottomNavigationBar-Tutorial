import "package:flutter/material.dart";

void main() {
  runApp(new MaterialApp(
    home: new Example(),
  ));
}

class Example extends StatefulWidget {
  @override
  ExampleState createState() => new ExampleState();
}

class ExampleState extends State<Example> {

  int currentTab = 0; // Index of currently opened tab.
  PageOne pageOne = new PageOne(); // Page that corresponds with the first tab.
  PageTwo pageTwo = new PageTwo(); // Page that corresponds with the second tab.
  PageThree pageThree = new PageThree(); // Page that corresponds with the third tab.
  List<Widget> pages; // List of all pages that can be opened from our BottomNavigationBar.
                      // Index 0 represents the page for the 0th tab, index 1 represents the page for the 1st tab etc...
  Widget currentPage; // Page that is open at the moment.


  @override
  void initState() {
    super.initState();
    pages = [pageOne, pageTwo, pageThree]; // Populate our pages list.
    currentPage = pageOne; // Setting the first page that we'd like to show our user.
                           // Notice that pageOne is the 0th item in the pages list. This corresponds with our initial currentTab value.
                           // These two should match at the start of our application.
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Here we create our BottomNavigationBar.
    final BottomNavigationBar navBar = new BottomNavigationBar(
      currentIndex: currentTab, // Our currentIndex will be the currentTab value. So we need to update this whenever we tab on a new page!
      onTap: (int numTab) { // numTab will be the index of the tab that is pressed.
        setState(() { // Setting the state so we can show our new page.
          print("Current tab: " + numTab.toString()); // Printing for debugging reasons.
          currentTab = numTab; // Updating our currentTab with the tab that is pressed [See 43].
          currentPage = pages[numTab]; // Updating the page that we'd like to show to the user.
        });
      },
      items: <BottomNavigationBarItem>[ // Visuals, see docs for more information: https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html
        new BottomNavigationBarItem( //numTab 0
          icon: new Icon(Icons.ac_unit),
          title: new Text("Ac unit")
        ),
        new BottomNavigationBarItem( //numTab 1
          icon: new Icon(Icons.access_alarm),
          title: new Text("Access alarm")
        ),
        new BottomNavigationBarItem( //numTab 2
          icon: new Icon(Icons.access_alarms),
          title: new Text("Access alarms")
        )
      ],
    );


    return new Scaffold(
      bottomNavigationBar: navBar, // Assigning our navBar to the Scaffold's bottomNavigationBar property.
      body: currentPage, // The body will be the currentPage. Which we update when a tab is pressed.
    );
  }
}

class PageOne extends StatelessWidget { // Creating a simple example page.
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("Page one"));
  }
}

class PageTwo extends StatelessWidget { // Creating a simple example page.
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("Page two"));
  }
}

class PageThree extends StatelessWidget { // Creating a simple example page.
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("Page three"));
  }
}
