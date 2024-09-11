# gcc-bug

```
] g++ -D_REENTRANT -D_GNU_SOURCE -D__x86_64__ -Wall -Wno-parentheses -Wno-invalid-offsetof -Wno-misleading-indentation -fstrict-aliasing -std=gnu++2b -ftemplate-backtrace-limit=0 -g -march=x86-64-v2 -fno-math-errno -fno-trapping-math -fno-rounding-math -fno-signaling-nans -DZDEBUG -Wno-non-template-friend -Wno-enum-compare -Wno-deprecated-enum-enum-conversion -Wno-int-in-bool-context -Wno-unused-value -Wno-sign-compare -c gcc-bug.cc -o gcc-bug.o
gcc-bug.cc: In instantiation of ‘Zdf::DFWriter_<Zdf::WrapType<Frame, false>, ZmHeap__<Zdf::DFWriter_HeapID, 64, 8, false> >::write(const O&)::<lambda(auto:131)> [with auto:131 = ZuConstant<unsigned int, 0>]’:
gcc-bug.cc:8091:44:   required from ‘struct ZuUnroll::Deduce<ZuSeq<0, 1>, Zdf::DFWriter_<Zdf::WrapType<Frame, false>, ZmHeap__<Zdf::DFWriter_HeapID, 64, 8, false> >::write(const O&)::<lambda(auto:131)> >’
 8091 |   using R = ZuDecay<decltype(ZuDeclVal<L>()(ZuUnsigned<0>{}))>;
      |                              ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
gcc-bug.cc:8102:52:   required from ‘constexpr decltype(auto) ZuUnroll::all(L) [with List = ZuSeq<0, 1>; L = Zdf::DFWriter_<Zdf::WrapType<Frame, false>, ZmHeap__<Zdf::DFWriter_HeapID, 64, 8, false> >::write(const O&)::<lambda(auto:131)>]’
 8102 |   return All<typename Deduce<List, L>::R, List>::fn(ZuMv(l));
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
gcc-bug.cc:8105:25:   required from ‘constexpr decltype(auto) ZuUnroll::all(L) [with unsigned int N = 2; L = Zdf::DFWriter_<Zdf::WrapType<Frame, false>, ZmHeap__<Zdf::DFWriter_HeapID, 64, 8, false> >::write(const O&)::<lambda(auto:131)>]’
 8105 |   return all<ZuMkSeq<N>>(ZuMv(l));
      |          ~~~~~~~~~~~~~~~^~~~~~~~~
gcc-bug.cc:67341:29:   required from ‘void Zdf::DFWriter_<W, Heap>::write(const O&) [with W = Zdf::WrapType<Frame, false>; Heap = ZmHeap__<Zdf::DFWriter_HeapID, 64, 8, false>; O = Frame]’
67341 |     ZuUnroll::all<WrRefs::N>([this, &o, &ok](auto I) {
      |     ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
67342 |       if (!ok) return;
      |       ~~~~~~~~~~~~~~~~       
67343 |       using Field = ZuType<I, Fields>;
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67344 |       enum { NDP = GetNDP<Field>{} };
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67345 |       if constexpr (Field::Code == Float)
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67346 |         ok = ok && m_wrRefs.template p<I>()->write(Field::get(o));
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67347 |       else if constexpr (Field::Code == Fixed)
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67348 |         ok = ok && m_wrRefs.template p<I>()->write(Field::get(o).adjust(NDP));
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67349 |       else if constexpr (Field::Code == Int8 || Field::Code == UInt8 ||
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67350 |                          Field::Code == Int16 || Field::Code == UInt16 ||
      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67351 |                          Field::Code == Int32 || Field::Code == UInt32 ||
      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67352 |                          Field::Code == Int64 || Field::Code == UInt64)
      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67353 |         ok = ok && m_wrRefs.template p<I>()->write(Field::get(o));
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67354 |       else if constexpr (Field::Code == Decimal)
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67355 |         ok = ok && m_wrRefs.template p<I>()->write(ZuFixed{Field::get(o), NDP});
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67356 |       else if constexpr (Field::Code == Time)
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67357 |         ok = ok &&
      |         ~~~~~~~~~~           
67358 |           m_wrRefs.template p<I>()->write(
      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67359 |             m_df->template series<I>()->nsecs(Field::get(o))
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
67360 |           );
      |           ~~                 
67361 |     });
      |     ~~                       
gcc-bug.cc:67927:15:   required from here
67927 |       w->write(frame);
      |       ~~~~~~~~^~~~~~~
gcc-bug.cc:67344:12: internal compiler error: in tsubst_expr, at cp/pt.cc:21463
67344 |       enum { NDP = GetNDP<Field>{} };
      |            ^
0x21a7bea internal_error(char const*, ...)
	???:0
0x703e99 fancy_abort(char const*, int, char const*)
	???:0
0x8e1dcf tsubst_template_args(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8d7e80 tsubst(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8e1dcf tsubst_template_args(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8d72c8 tsubst(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8d1578 tsubst_expr(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8e412c lookup_template_class(tree_node*, tree_node*, tree_node*, tree_node*, int, int)
	???:0
0x8ca115 instantiate_decl(tree_node*, bool, bool)
	???:0
0x7a2512 maybe_instantiate_decl(tree_node*)
	???:0
0x7ffdcd mark_used(tree_node*, int)
	???:0
0x73fd5e build_op_call(tree_node*, vec<tree_node*, va_gc, vl_embed>**, int)
	???:0
0x90829a finish_call_expr(tree_node*, vec<tree_node*, va_gc, vl_embed>**, bool, bool, int)
	???:0
0x8d48af tsubst_expr(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8d7d7d tsubst(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8e1dcf tsubst_template_args(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8d72c8 tsubst(tree_node*, tree_node*, int, tree_node*)
	???:0
0x8e093d instantiate_class_template(tree_node*)
	???:0
0x93990b complete_type(tree_node*)
	???:0
0x944bbb complete_type_or_maybe_complain(tree_node*, tree_node*, int)
	???:0
Please submit a full bug report, with preprocessed source (by using -freport-bug).
Please include the complete backtrace with any bug report.
See <https://gitlab.archlinux.org/archlinux/packaging/packages/gcc/-/issues> for instructions.
```
