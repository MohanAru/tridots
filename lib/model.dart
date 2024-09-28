// To parse this JSON data, do
//
//     final newsLog = newsLogFromJson(jsonString);

import 'dart:convert';

NewsLog newsLogFromJson(String str) => NewsLog.fromJson(json.decode(str));

String newsLogToJson(NewsLog data) => json.encode(data.toJson());

class NewsLog {
  Message message;

  NewsLog({
    required this.message,
  });

  factory NewsLog.fromJson(Map<String, dynamic> json) => NewsLog(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  SubHeader subHeader;
  dynamic sideMenu;
  dynamic listContent;
  dynamic listStyle;
  String pageType;
  List<PageContent> pageContent;
  HeaderContent headerContent;
  FooterContent footerContent;

  Message({
    required this.subHeader,
    required this.sideMenu,
    required this.listContent,
    required this.listStyle,
    required this.pageType,
    required this.pageContent,
    required this.headerContent,
    required this.footerContent,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        subHeader: SubHeader.fromJson(json["sub_header"]),
        sideMenu: json["side_menu"],
        listContent: json["list_content"],
        listStyle: json["list_style"],
        pageType: json["page_type"],
        pageContent:
            List<PageContent>.from(json["page_content"].map((x) => PageContent.fromJson(x))),
        headerContent: HeaderContent.fromJson(json["header_content"]),
        footerContent: FooterContent.fromJson(json["footer_content"]),
      );

  Map<String, dynamic> toJson() => {
        "sub_header": subHeader.toJson(),
        "side_menu": sideMenu,
        "list_content": listContent,
        "list_style": listStyle,
        "page_type": pageType,
        "page_content": List<dynamic>.from(pageContent.map((x) => x.toJson())),
        "header_content": headerContent.toJson(),
        "footer_content": footerContent.toJson(),
      };
}

class FooterContent {
  String title;
  int enableLinkIcon;
  dynamic layoutJson;
  int enableCopyright;
  String copyrightLayout;
  String fcCtType;
  String cpFcAlignment;
  String scCtType;
  String cpScAlignment;
  dynamic cpFcContent;
  dynamic cpScContent;
  List<FooterContentItem> items;

  FooterContent({
    required this.title,
    required this.enableLinkIcon,
    required this.layoutJson,
    required this.enableCopyright,
    required this.copyrightLayout,
    required this.fcCtType,
    required this.cpFcAlignment,
    required this.scCtType,
    required this.cpScAlignment,
    required this.cpFcContent,
    required this.cpScContent,
    required this.items,
  });

  factory FooterContent.fromJson(Map<String, dynamic> json) => FooterContent(
        title: json["title"],
        enableLinkIcon: json["enable_link_icon"],
        layoutJson: json["layout_json"],
        enableCopyright: json["enable_copyright"],
        copyrightLayout: json["copyright_layout"],
        fcCtType: json["fc_ct_type"],
        cpFcAlignment: json["cp_fc_alignment"],
        scCtType: json["sc_ct_type"],
        cpScAlignment: json["cp_sc_alignment"],
        cpFcContent: json["cp_fc_content"],
        cpScContent: json["cp_sc_content"],
        items:
            List<FooterContentItem>.from(json["items"].map((x) => FooterContentItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "enable_link_icon": enableLinkIcon,
        "layout_json": layoutJson,
        "enable_copyright": enableCopyright,
        "copyright_layout": copyrightLayout,
        "fc_ct_type": fcCtType,
        "cp_fc_alignment": cpFcAlignment,
        "sc_ct_type": scCtType,
        "cp_sc_alignment": cpScAlignment,
        "cp_fc_content": cpFcContent,
        "cp_sc_content": cpScContent,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class FooterContentItem {
  int columnIndex;
  List<ItemItem> items;

  FooterContentItem({
    required this.columnIndex,
    required this.items,
  });

  factory FooterContentItem.fromJson(Map<String, dynamic> json) => FooterContentItem(
        columnIndex: json["column_index"],
        items: List<ItemItem>.from(json["items"].map((x) => ItemItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "column_index": columnIndex,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ItemItem {
  String? addressContent;
  String className;
  int columnIndex;
  String contentType;
  int dynamicData;
  String? emailIcon;
  String? emailId;
  String? icon;
  int isFullWidth;
  dynamic layoutJson;
  int loginRequired;
  String? logo;
  dynamic mobileAppTemplate;
  int noOfRecords;
  String? phoneIcon;
  String? phoneNo;
  dynamic referenceDocument;
  String section;
  String sectionName;
  SectionType sectionType;
  String? title;
  dynamic viewMoreRedirectTo;
  String viewType;
  List<SocialLink>? socialLinks;
  List<Menu>? menus;
  String? button;
  String? description;
  String? image;
  String? primaryText;
  String? secondaryText;

  ItemItem({
    this.addressContent,
    required this.className,
    required this.columnIndex,
    required this.contentType,
    required this.dynamicData,
    this.emailIcon,
    this.emailId,
    this.icon,
    required this.isFullWidth,
    required this.layoutJson,
    required this.loginRequired,
    this.logo,
    required this.mobileAppTemplate,
    required this.noOfRecords,
    this.phoneIcon,
    this.phoneNo,
    required this.referenceDocument,
    required this.section,
    required this.sectionName,
    required this.sectionType,
    this.title,
    required this.viewMoreRedirectTo,
    required this.viewType,
    this.socialLinks,
    this.menus,
    this.button,
    this.description,
    this.image,
    this.primaryText,
    this.secondaryText,
  });

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
        addressContent: json["address_content"],
        className: json["class_name"],
        columnIndex: json["column_index"],
        contentType: json["content_type"],
        dynamicData: json["dynamic_data"],
        emailIcon: json["email_icon"],
        emailId: json["email_id"],
        icon: json["icon"],
        isFullWidth: json["is_full_width"],
        layoutJson: json["layout_json"],
        loginRequired: json["login_required"],
        logo: json["logo"],
        mobileAppTemplate: json["mobile_app_template"],
        noOfRecords: json["no_of_records"],
        phoneIcon: json["phone_icon"],
        phoneNo: json["phone_no"],
        referenceDocument: json["reference_document"],
        section: json["section"],
        sectionName: json["section_name"],
        sectionType: sectionTypeValues.map[json["section_type"]]!,
        title: json["title"],
        viewMoreRedirectTo: json["view_more_redirect_to"],
        viewType: json["view_type"],
        socialLinks: json["social_links"] == null
            ? []
            : List<SocialLink>.from(json["social_links"]!.map((x) => SocialLink.fromJson(x))),
        menus: json["menus"] == null
            ? []
            : List<Menu>.from(json["menus"]!.map((x) => Menu.fromJson(x))),
        button: json["button"],
        description: json["description"],
        image: json["image"],
        primaryText: json["primary_text"],
        secondaryText: json["secondary_text"],
      );

  Map<String, dynamic> toJson() => {
        "address_content": addressContent,
        "class_name": className,
        "column_index": columnIndex,
        "content_type": contentType,
        "dynamic_data": dynamicData,
        "email_icon": emailIcon,
        "email_id": emailId,
        "icon": icon,
        "is_full_width": isFullWidth,
        "layout_json": layoutJson,
        "login_required": loginRequired,
        "logo": logo,
        "mobile_app_template": mobileAppTemplate,
        "no_of_records": noOfRecords,
        "phone_icon": phoneIcon,
        "phone_no": phoneNo,
        "reference_document": referenceDocument,
        "section": section,
        "section_name": sectionName,
        "section_type": sectionTypeValues.reverse[sectionType],
        "title": title,
        "view_more_redirect_to": viewMoreRedirectTo,
        "view_type": viewType,
        "social_links":
            socialLinks == null ? [] : List<dynamic>.from(socialLinks!.map((x) => x.toJson())),
        "menus": menus == null ? [] : List<dynamic>.from(menus!.map((x) => x.toJson())),
        "button": button,
        "description": description,
        "image": image,
        "primary_text": primaryText,
        "secondary_text": secondaryText,
      };
}

class Menu {
  String menuLabel;
  String? redirectUrl;

  Menu({
    required this.menuLabel,
    required this.redirectUrl,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        menuLabel: json["menu_label"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "menu_label": menuLabel,
        "redirect_url": redirectUrl,
      };
}

enum SectionType { MENU, STATIC_SECTION }

final sectionTypeValues =
    EnumValues({"Menu": SectionType.MENU, "Static Section": SectionType.STATIC_SECTION});

class SocialLink {
  String icon;
  int idx;
  String linkUrl;
  String type;

  SocialLink({
    required this.icon,
    required this.idx,
    required this.linkUrl,
    required this.type,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        icon: json["icon"],
        idx: json["idx"],
        linkUrl: json["link_url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "idx": idx,
        "link_url": linkUrl,
        "type": type,
      };
}

class HeaderContent {
  int isTransparentHeader;
  String title;
  int isMenuFullWidth;
  dynamic layoutJson;
  int enableTopMenu;
  int stickyOnTop;
  int isDismissable;
  String layout;
  int stickyHeader;
  int callToActionButton;
  String buttonText;
  String buttonLink;
  String linkTarget;
  String stickyHeaderBackground;
  String menuTextColor;
  List<dynamic> items;

  HeaderContent({
    required this.isTransparentHeader,
    required this.title,
    required this.isMenuFullWidth,
    required this.layoutJson,
    required this.enableTopMenu,
    required this.stickyOnTop,
    required this.isDismissable,
    required this.layout,
    required this.stickyHeader,
    required this.callToActionButton,
    required this.buttonText,
    required this.buttonLink,
    required this.linkTarget,
    required this.stickyHeaderBackground,
    required this.menuTextColor,
    required this.items,
  });

  factory HeaderContent.fromJson(Map<String, dynamic> json) => HeaderContent(
        isTransparentHeader: json["is_transparent_header"],
        title: json["title"],
        isMenuFullWidth: json["is_menu_full_width"],
        layoutJson: json["layout_json"],
        enableTopMenu: json["enable_top_menu"],
        stickyOnTop: json["sticky_on_top"],
        isDismissable: json["is_dismissable"],
        layout: json["layout"],
        stickyHeader: json["sticky_header"],
        callToActionButton: json["call_to_action_button"],
        buttonText: json["button_text"],
        buttonLink: json["button_link"],
        linkTarget: json["link_target"],
        stickyHeaderBackground: json["sticky_header_background"],
        menuTextColor: json["menu_text_color"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "is_transparent_header": isTransparentHeader,
        "title": title,
        "is_menu_full_width": isMenuFullWidth,
        "layout_json": layoutJson,
        "enable_top_menu": enableTopMenu,
        "sticky_on_top": stickyOnTop,
        "is_dismissable": isDismissable,
        "layout": layout,
        "sticky_header": stickyHeader,
        "call_to_action_button": callToActionButton,
        "button_text": buttonText,
        "button_link": buttonLink,
        "link_target": linkTarget,
        "sticky_header_background": stickyHeaderBackground,
        "menu_text_color": menuTextColor,
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}

class PageContent {
  String className;
  String contentType;
  int dynamicData;
  int isFullWidth;
  String layoutJson;
  int loginRequired;
  dynamic mobileAppTemplate;
  int noOfRecords;
  dynamic referenceDocument;
  String section;
  String sectionName;
  SectionType sectionType;
  dynamic viewMoreRedirectTo;
  String viewType;
  Map<String, DatumValue> data;

  PageContent({
    required this.className,
    required this.contentType,
    required this.dynamicData,
    required this.isFullWidth,
    required this.layoutJson,
    required this.loginRequired,
    required this.mobileAppTemplate,
    required this.noOfRecords,
    required this.referenceDocument,
    required this.section,
    required this.sectionName,
    required this.sectionType,
    required this.viewMoreRedirectTo,
    required this.viewType,
    required this.data,
  });

  factory PageContent.fromJson(Map<String, dynamic> json) => PageContent(
        className: json["class_name"],
        contentType: json["content_type"],
        dynamicData: json["dynamic_data"],
        isFullWidth: json["is_full_width"],
        layoutJson: json["layout_json"],
        loginRequired: json["login_required"],
        mobileAppTemplate: json["mobile_app_template"],
        noOfRecords: json["no_of_records"],
        referenceDocument: json["reference_document"],
        section: json["section"],
        sectionName: json["section_name"],
        sectionType: sectionTypeValues.map[json["section_type"]]!,
        viewMoreRedirectTo: json["view_more_redirect_to"],
        viewType: json["view_type"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, DatumValue>(k, DatumValue.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
        "content_type": contentType,
        "dynamic_data": dynamicData,
        "is_full_width": isFullWidth,
        "layout_json": layoutJson,
        "login_required": loginRequired,
        "mobile_app_template": mobileAppTemplate,
        "no_of_records": noOfRecords,
        "reference_document": referenceDocument,
        "section": section,
        "section_name": sectionName,
        "section_type": sectionTypeValues.reverse[sectionType],
        "view_more_redirect_to": viewMoreRedirectTo,
        "view_type": viewType,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class DatumValue {
  List<DatumElement>? data;
  String? section;
  String? dotype;

  DatumValue({
    this.data,
    this.section,
    this.dotype,
  });

  factory DatumValue.fromJson(Map<String, dynamic> json) => DatumValue(
        data: json["data"] == null
            ? []
            : List<DatumElement>.from(json["data"]!.map((x) => DatumElement.fromJson(x))),
        section: json["section"],
        dotype: json["dotype"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "section": section,
        "dotype": dotype,
      };
}

class DatumElement {
  String? blogIntro;
  String name;
  String? title;
  String route;
  String? thumbnailImagee;
  String? image;
  String? subTitle;
  String? userTags;
  String? location;
  String? primaryText;
  dynamic publisher;
  dynamic advertisementTags;
  List<Tag>? tags;
  String? secondaryText;
  String? videoId;
  String? videoType;
  String? videoImage;
  String? description;
  String? intro;
  String? category;
  String? thumbnailImage;
  int? irPrime;

  DatumElement({
    this.blogIntro,
    required this.name,
    this.title,
    required this.route,
    this.thumbnailImagee,
    this.image,
    this.subTitle,
    this.userTags,
    this.location,
    this.primaryText,
    this.publisher,
    this.advertisementTags,
    this.tags,
    this.secondaryText,
    this.videoId,
    this.videoType,
    this.videoImage,
    this.description,
    this.intro,
    this.category,
    this.thumbnailImage,
    this.irPrime,
  });

  factory DatumElement.fromJson(Map<String, dynamic> json) => DatumElement(
        blogIntro: json["blog_intro"],
        name: json["name"],
        title: json["title"],
        route: json["route"],
        thumbnailImagee: json["thumbnail_imagee"],
        image: json["image"],
        subTitle: json["sub_title"],
        userTags: json["_user_tags"],
        location: json["location"],
        primaryText: json["primary_text"],
        publisher: json["publisher"],
        advertisementTags: json["advertisement_tags"],
        tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        secondaryText: json["secondary_text"],
        videoId: json["video_id"],
        videoType: json["video_type"],
        videoImage: json["video_image"],
        description: json["description"],
        intro: json["intro"],
        category: json["category"],
        thumbnailImage: json["thumbnail_image"],
        irPrime: json["ir_prime"],
      );

  Map<String, dynamic> toJson() => {
        "blog_intro": blogIntro,
        "name": name,
        "title": title,
        "route": route,
        "thumbnail_imagee": thumbnailImagee,
        "image": image,
        "sub_title": subTitle,
        "_user_tags": userTags,
        "location": location,
        "primary_text": primaryText,
        "publisher": publisher,
        "advertisement_tags": advertisementTags,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "secondary_text": secondaryText,
        "video_id": videoId,
        "video_type": videoType,
        "video_image": videoImage,
        "description": description,
        "intro": intro,
        "category": category,
        "thumbnail_image": thumbnailImage,
        "ir_prime": irPrime,
      };
}

class Tag {
  String? route;
  String tag;

  Tag({
    required this.route,
    required this.tag,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        route: json["route"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "route": route,
        "tag": tag,
      };
}

class SubHeader {
  int enabled;

  SubHeader({
    required this.enabled,
  });

  factory SubHeader.fromJson(Map<String, dynamic> json) => SubHeader(
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
