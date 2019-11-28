import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});
  final int initValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  /*
   * initState 方法
   */
  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }
  
  /*
   * didUpdateWidget 方法
   */
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  /*
   * deactivate 方法
   */
  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  /*
   * dispose 方法
   */
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // reassemble 方法
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // didChangeDependencies 方法
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  /*
   * build 方法
   */
  @override
  Widget build(BuildContext context) {
    print(" >>> build");
    return Scaffold(
      appBar: AppBar(
        title: Text("子树获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              _counter++;
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = Scaffold.of(context);
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar >>> $_counter"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
