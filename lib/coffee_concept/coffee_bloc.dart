import 'package:flutter/material.dart';
const _initialPage= 8.0;
class CoffeeBLoC {


   final pageCoffeeController = PageController(
    viewportFraction: 0.35,
    initialPage: _initialPage.toInt(),
  );
  final pageTextController=PageController(initialPage: _initialPage.toInt()); 
  
  final  currentPage = ValueNotifier<double>(_initialPage) ; // Specify the type explicitly as 'double'

 final textPage = ValueNotifier<double>(_initialPage) ;


void init(){
  currentPage.value= _initialPage;
  textPage.value= _initialPage;
   pageCoffeeController.addListener(_coffeeScrollListener);
    pageTextController.addListener(_textScrollListener);
}


  void _coffeeScrollListener() {
   
      currentPage.value = pageCoffeeController.page!;
   
  } 


void _textScrollListener() {
  textPage.value = pageTextController.page ?? 0.0;
}


  void dispose(){

    pageCoffeeController.removeListener(_coffeeScrollListener);
    pageTextController.removeListener(_textScrollListener);
    pageCoffeeController.dispose();
    pageTextController.dispose();

  }



}

class CoffeeProvider extends InheritedWidget {
  final CoffeeBLoC bloc;

  CoffeeProvider({required this.bloc, required Widget child})
      : super(child: child);


  static CoffeeProvider of(BuildContext context)=> context.findAncestorWidgetOfExactType<CoffeeProvider>()!;

  @override
  bool updateShouldNotify(covariant CoffeeProvider oldWidget) => false;
}
