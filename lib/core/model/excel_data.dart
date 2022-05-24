class ExcelData {
  int id;
  int parentId;
  String receivingState;
  String receivingCity;
  String receivingStreet;
  String receivingLandmark;
  String receivingBuildingNumber;
  String receivingFloor;
  String receivingApartment;
  String receivingLat;
  String receivingLng;
  String dateToReceiveShipment;
  String deliveringState;
  String deliveringCity;
  String deliveringStreet;
  String deliveringLandmark;
  String deliveringBuildingNumber;
  String deliveringFloor;
  String deliveringApartment;
  String deliveringLat;
  String deliveringLng;
  String dateToDeliverShipment;
  String clientName;
  String clientPhone;
  String notes;
  String paymentMethod;
  String amount;
  String expectedShippingCost;
  String agreedShippingCost;
  int merchantId;
  int courierId;
  String status;
  String handoverCodeCourierToMerchant;
  String handoverQrcodeCourierToMerchant;
  String handoverCodeMerchantToCourier;
  String handoverQrcodeMerchantToCourier;
  String handoverCodeCourierToCustomer;
  String handoverQrcodeCourierToCustomer;
  int isOfferBased;
  int closed;
  String closedAt;
  String createdAt;
  String updatedAt;
  String deletedAt;

  ExcelData(
      {this.id,
      this.parentId,
      this.receivingState,
      this.receivingCity,
      this.receivingStreet,
      this.receivingLandmark,
      this.receivingBuildingNumber,
      this.receivingFloor,
      this.receivingApartment,
      this.receivingLat,
      this.receivingLng,
      this.dateToReceiveShipment,
      this.deliveringState,
      this.deliveringCity,
      this.deliveringStreet,
      this.deliveringLandmark,
      this.deliveringBuildingNumber,
      this.deliveringFloor,
      this.deliveringApartment,
      this.deliveringLat,
      this.deliveringLng,
      this.dateToDeliverShipment,
      this.clientName,
      this.clientPhone,
      this.notes,
      this.paymentMethod,
      this.amount,
      this.expectedShippingCost,
      this.agreedShippingCost,
      this.merchantId,
      this.courierId,
      this.status,
      this.handoverCodeCourierToMerchant,
      this.handoverQrcodeCourierToMerchant,
      this.handoverCodeMerchantToCourier,
      this.handoverQrcodeMerchantToCourier,
      this.handoverCodeCourierToCustomer,
      this.handoverQrcodeCourierToCustomer,
      this.isOfferBased,
      this.closed,
      this.closedAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ExcelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    receivingState = json['receiving_state'].toString();
    receivingCity = json['receiving_city'].toString();
    receivingStreet = json['receiving_street'].toString();
    receivingLandmark = json['receiving_landmark'].toString();
    receivingBuildingNumber = json['receiving_building_number'].toString();
    receivingFloor = json['receiving_floor'].toString();
    receivingApartment = json['receiving_apartment'].toString();
    receivingLat = json['receiving_lat'].toString();
    receivingLng = json['receiving_lng'].toString();
    dateToReceiveShipment = json['date_to_receive_shipment'].toString();
    deliveringState = json['delivering_state'].toString();
    deliveringCity = json['delivering_city'].toString();
    deliveringStreet = json['delivering_street'].toString();
    deliveringLandmark = json['delivering_landmark'].toString();
    deliveringBuildingNumber = json['delivering_building_number'].toString();
    deliveringFloor = json['delivering_floor'].toString();
    deliveringApartment = json['delivering_apartment'].toString();
    deliveringLat = json['delivering_lat'].toString();
    deliveringLng = json['delivering_lng'].toString();
    dateToDeliverShipment = json['date_to_deliver_shipment'].toString();
    clientName = json['client_name'].toString();
    clientPhone = json['client_phone'].toString();
    notes = json['notes'].toString();
    paymentMethod = json['payment_method'].toString();
    amount = json['amount'].toString();
    expectedShippingCost = json['expected_shipping_cost'].toString();
    agreedShippingCost = json['agreed_shipping_cost'].toString();
    merchantId = json['merchant_id'];
    courierId = json['courier_id'];
    status = json['status'].toString();
    handoverCodeCourierToMerchant = json['handover_code_courier_to_merchant'].toString();
    handoverQrcodeCourierToMerchant =
        json['handover_qrcode_courier_to_merchant'].toString();
    handoverCodeMerchantToCourier = json['handover_code_merchant_to_courier'].toString();
    handoverQrcodeMerchantToCourier =
        json['handover_qrcode_merchant_to_courier'].toString();
    handoverCodeCourierToCustomer = json['handover_code_courier_to_customer'].toString();
    handoverQrcodeCourierToCustomer =
        json['handover_qrcode_courier_to_customer'].toString();
    isOfferBased = json['is_offer_based'];
    closed = json['closed'];
    closedAt = json['closed_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
    deletedAt = json['deleted_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['parent_id'] = parentId;
    data['receiving_state'] = receivingState;
    data['receiving_city'] = receivingCity;
    data['receiving_street'] = receivingStreet;
    data['receiving_landmark'] = receivingLandmark;
    data['receiving_building_number'] = receivingBuildingNumber;
    data['receiving_floor'] = receivingFloor;
    data['receiving_apartment'] = receivingApartment;
    data['receiving_lat'] = receivingLat;
    data['receiving_lng'] = receivingLng;
    data['date_to_receive_shipment'] = dateToReceiveShipment;
    data['delivering_state'] = deliveringState;
    data['delivering_city'] = deliveringCity;
    data['delivering_street'] = deliveringStreet;
    data['delivering_landmark'] = deliveringLandmark;
    data['delivering_building_number'] = deliveringBuildingNumber;
    data['delivering_floor'] = deliveringFloor;
    data['delivering_apartment'] = deliveringApartment;
    data['delivering_lat'] = deliveringLat;
    data['delivering_lng'] = deliveringLng;
    data['date_to_deliver_shipment'] = dateToDeliverShipment;
    data['client_name'] = clientName;
    data['client_phone'] = clientPhone;
    data['notes'] = notes;
    data['payment_method'] = paymentMethod;
    data['amount'] = amount;
    data['expected_shipping_cost'] = expectedShippingCost;
    data['agreed_shipping_cost'] = agreedShippingCost;
    data['merchant_id'] = merchantId;
    data['courier_id'] = courierId;
    data['status'] = status;
    data['handover_code_courier_to_merchant'] =
        handoverCodeCourierToMerchant;
    data['handover_qrcode_courier_to_merchant'] =
        handoverQrcodeCourierToMerchant;
    data['handover_code_merchant_to_courier'] =
        handoverCodeMerchantToCourier;
    data['handover_qrcode_merchant_to_courier'] =
        handoverQrcodeMerchantToCourier;
    data['handover_code_courier_to_customer'] =
        handoverCodeCourierToCustomer;
    data['handover_qrcode_courier_to_customer'] =
        handoverQrcodeCourierToCustomer;
    data['is_offer_based'] = isOfferBased;
    data['closed'] = closed;
    data['closed_at'] = closedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }

  @override
  String toString() {
    return 'ExcelData{id: $id, parentId: $parentId, receivingState: $receivingState, receivingCity: $receivingCity, receivingStreet: $receivingStreet, receivingLandmark: $receivingLandmark, receivingBuildingNumber: $receivingBuildingNumber, receivingFloor: $receivingFloor, receivingApartment: $receivingApartment, receivingLat: $receivingLat, receivingLng: $receivingLng, dateToReceiveShipment: $dateToReceiveShipment, deliveringState: $deliveringState, deliveringCity: $deliveringCity, deliveringStreet: $deliveringStreet, deliveringLandmark: $deliveringLandmark, deliveringBuildingNumber: $deliveringBuildingNumber, deliveringFloor: $deliveringFloor, deliveringApartment: $deliveringApartment, deliveringLat: $deliveringLat, deliveringLng: $deliveringLng, dateToDeliverShipment: $dateToDeliverShipment, clientName: $clientName, clientPhone: $clientPhone, notes: $notes, paymentMethod: $paymentMethod, amount: $amount, expectedShippingCost: $expectedShippingCost, agreedShippingCost: $agreedShippingCost, merchantId: $merchantId, courierId: $courierId, status: $status, handoverCodeCourierToMerchant: $handoverCodeCourierToMerchant, handoverQrcodeCourierToMerchant: $handoverQrcodeCourierToMerchant, handoverCodeMerchantToCourier: $handoverCodeMerchantToCourier, handoverQrcodeMerchantToCourier: $handoverQrcodeMerchantToCourier, handoverCodeCourierToCustomer: $handoverCodeCourierToCustomer, handoverQrcodeCourierToCustomer: $handoverQrcodeCourierToCustomer, isOfferBased: $isOfferBased, closed: $closed, closedAt: $closedAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt}';
  }
}
