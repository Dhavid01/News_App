import 'package:flutter/material.dart';
import 'package:news/views/search/search_view.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, this.text}) : super(key: key);

  final String? text;
  @override
  State<SearchBar> createState() => _SearchState();
}

class _SearchState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.text!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/world.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.5),
                ),
                margin: const EdgeInsets.all(20),
                height: 50,
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 4),
                child: TextField(
                  onSubmitted: (value) {
                    value = _controller.text;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SearchView(
                              q: value,
                            )),
                      ),
                    );
                  },
                  controller: _controller,
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () => _controller.clear(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                      border: InputBorder.none),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
